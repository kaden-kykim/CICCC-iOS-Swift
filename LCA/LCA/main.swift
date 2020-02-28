//
//  main.swift
//  LCA
//
//  Created by Kaden Kim on 2020-02-20.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

let lcaTree = LCATree()
let lcaResults = lcaTree.getLCA()
for result in lcaResults {
    print(result)
}

/// For Test case files
//let dataPath = "/Users/Kyeongyul/Workspace/CICCC/Mobile/Dataset/LCA/TestCases/"
//let inExt = ".in", outExt = ".out"
//let fileManager = FileManager()
//var testCases = [String]()
//try! testCases = fileManager.contentsOfDirectory(atPath: dataPath)
//for content in testCases {
//    let dotIndex = content.firstIndex(of: ".")
//    if let dotIndex = dotIndex {
//        if dotIndex == content.startIndex {
//            continue
//        }
//        let fileName = content.prefix(upTo: dotIndex)
//        let ext = content.suffix(from: dotIndex)
//        if !fileManager.fileExists(atPath: "\(dataPath)\(fileName)\(outExt)") {
//            print("There is no output file")
//            continue
//        }
//        if ext == inExt {
//            freopen("\(dataPath)\(fileName)\(ext)", "r", stdin)
//            let start = DispatchTime.now()
//            let lcaTree = LCATree()
//            let lcaResults = lcaTree.getLCA()
//            let end = DispatchTime.now()
//            freopen("\(dataPath)\(fileName)\(outExt)", "r", stdin)
//            var gt = [Int]()
//            while let line = readLine() {
//                gt.append(Int(line)!)
//            }
//            print("LCA Case \(fileName): \((gt == lcaResults) ? "Correct" : "Incorrect"), " +
//                "Time: \(Double(end.uptimeNanoseconds - start.uptimeNanoseconds) / 1_000_000)ms")
//        }
//    }
//}
