//
//  StringMatching.swift
//  GroupPresentation1
//
//  Created by Kaden Kim on 2020-02-23.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

func KMPMatching(_ text: String, pattern: String) -> Int {
    let tStart = text.startIndex, pStart = pattern.startIndex
    let failureArray = KMPFailureFunction(pattern)
    var cur = 0, index = 0
    while cur < text.count {
        if text[text.index(tStart, offsetBy: cur)] == pattern[pattern.index(pStart, offsetBy: index)] {
            if index == pattern.count - 1 {
                return cur - index
            } else {
                cur += 1
                index += 1
            }
        } else {
            if index > 0 {
                index = failureArray[index - 1]
            } else {
                cur += 1
            }
        }
    }
    return -1
}

fileprivate func KMPFailureFunction(_ pattern: String) -> [Int] {
    let pStart = pattern.startIndex
    var failureArray: [Int] = Array.init(repeating: 0, count: pattern.count)
    failureArray[0] = 0
    var curPos = 1, index = 0
    while curPos < pattern.count {
        if pattern[pattern.index(pStart, offsetBy: curPos)] == pattern[pattern.index(pStart, offsetBy: index)] {
            failureArray[curPos] = index + 1
            curPos += 1
            index += 1
        } else if index > 0 {
            index = failureArray[index - 1]
        } else {
            failureArray[curPos] = 0
            curPos += 1
        }
    }
    return failureArray
}
