//
//  main.swift
//  SushiReviews
//
//  Created by Kaden Kim on 2020-02-28.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

//print(sushiReviews())

func invokeFunction() -> [Int] {
    var result = [Int]()
    result.append(sushiReviews())
    return result
}

let testPath = "/Users/Kyeongyul/Workspace/CICCC/Mobile/Dataset/SushiReviews/TestCases"
//let testPath = "/Users/Kyeongyul/Workspace/CICCC/Mobile/Dataset/SushiReviews/Test2"
testCaseScript(testCasePath: testPath, invokeFunction: invokeFunction)
