//
//  Crawler.swift
//  FileSystemCrawler
//
//  Created by Kaden Kim on 2020-02-13.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

let listBranch = "├─"
let listEnd = "└─"
let listAsParent = "│ "
let listBlank = "  "

func crawl(atPath path: String) {
    let fileManager = FileManager()
    var isDir: ObjCBool = true
    
    if !fileManager.fileExists(atPath: path, isDirectory: &isDir) {
        if !isDir.boolValue {
            print("Path(as Argument) must exist and be a directory")
            return
        }
    }
    print("Contents at \(path):")
    var areAncestorsLastChild = [Bool]()
    crawlRecursive(atPath: path, depth: 0, areAncestorsLastChild: &areAncestorsLastChild)
}

private func crawlRecursive(atPath path: String, depth: Int, areAncestorsLastChild: inout [Bool], _ fileManager: FileManager = FileManager()) {
    var contents = [String]()
    do {
        contents = try fileManager.contentsOfDirectory(atPath: path)
    } catch {
        // TODO: "The folder “[Content Name]” doesn’t exist." occurs. Should be handled this error
    }
    
    for subPath in contents {
        var isDir: ObjCBool = true
        if fileManager.fileExists(atPath: path, isDirectory: &isDir) {
            var listPattern = String()
            for isAncestorLastChild in areAncestorsLastChild {
                listPattern.append("\((isAncestorLastChild) ? listBlank : listAsParent)\(listBlank)")
            }
            listPattern.append("\((subPath == contents[contents.count - 1]) ? listEnd : listBranch) ")
            print("\(listPattern)\(subPath)")
            
            if isDir.boolValue {
                let subDepth = depth + 1
                areAncestorsLastChild.append(subPath == contents[contents.count - 1])
                crawlRecursive(atPath: String("\(path)\(subPath)/"), depth: subDepth, areAncestorsLastChild: &areAncestorsLastChild, fileManager)
                areAncestorsLastChild.remove(at: areAncestorsLastChild.count - 1)
            }
        } else {
            print("Error: \(path) doesn't exist")
        }
    }
}
