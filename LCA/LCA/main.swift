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


// Below: For Testcase Files
//func invokeFunc() -> [Int] {
//    return LCATree().getLCA()
//}
//
//let testCasePath = "/Users/Kyeongyul/Workspace/CICCC/Mobile/Dataset/LCA/TestCases/"
//testCaseScript(testCasePath: testCasePath, invokeFunction: invokeFunc)
