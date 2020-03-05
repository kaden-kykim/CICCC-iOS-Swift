//
//  TestCaseScript.swift
//  TestCaseScript
//
//  Created by Kaden Kim on 2020-02-28.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

func testCaseScript(testCasePath: String, invokeFunction: () -> [Int]) {
    let url = URL(fileURLWithPath: testCasePath)
    let path = url.appendingPathComponent("").path
    let inExt = ".in", outExt = ".out"
    let fileManager = FileManager()
    var testCases = [String]()
    try! testCases = fileManager.contentsOfDirectory(atPath: path)
    testCases.sort()
    for content in testCases {
        let dotIndex = content.lastIndex(of: ".")
        if let dotIndex = dotIndex {
            if dotIndex == content.startIndex {
                continue
            }
            let fileName = content.prefix(upTo: dotIndex)
            let ext = content.suffix(from: dotIndex)
            if !fileManager.fileExists(atPath: "\(path)\(fileName)\(outExt)") {
                print("There is no output file")
                continue
            }
            if ext == inExt {
                freopen("\(path)\(fileName)\(ext)", "r", stdin)
                let start = DispatchTime.now()
                let results = invokeFunction()
                let end = DispatchTime.now()
                freopen("\(path)\(fileName)\(outExt)", "r", stdin)
                var gt = [Int]()
                while let line = readLine() {
                    gt.append(Int(line)!)
                }
                print("Case \(fileName): \((gt == results) ? "Pass" : "Fail") " +
                    "(Time: \(Double(end.uptimeNanoseconds - start.uptimeNanoseconds) / 1_000_000)ms)")
            }
        }
    }
}
