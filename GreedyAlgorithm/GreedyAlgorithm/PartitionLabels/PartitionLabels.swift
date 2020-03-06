//
//  PartitionLabels.swift
//  GreedyAlgorithm
//
//  Created by Kaden Kim on 2020-03-05.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

let asciiLowerA = Character("a").asciiValue!

func partitionLabels(_ S: String) -> [Int] {
    var charPosition = [[Int]](repeating: [Int](repeating: -1, count: 2), count: 26)
    for (index, ch) in S.enumerated() {
        let chVal = Int(ch.asciiValue! - asciiLowerA)
        if charPosition[chVal][0] == -1 {
           charPosition[chVal][0] = index
        }
        charPosition[chVal][1] = index
    }
    
    return partitioning(S, 0, charPosition)
}

fileprivate func partitioning(_ S: String, _ startIndex: Int, _ charPos: [[Int]]) -> [Int] {
    let length = S.count
    var result = [Int]()
    
    var calcIndex = charPos[Int(S.first!.asciiValue! - asciiLowerA)][1] - startIndex
    for (index, ch) in S.enumerated() {
        if index >= calcIndex { break }
        let curEndPos = charPos[Int(ch.asciiValue! - asciiLowerA)][1] - startIndex
        if calcIndex < curEndPos {
            calcIndex = curEndPos
        }
    }
    result.append(calcIndex + 1)
    
    if result[0] == length {
        return result
    }

    calcIndex = charPos[Int(S.last!.asciiValue! - asciiLowerA)][0] - startIndex
    for index in stride(from: length - 1, through: 0, by: -1) {
        if index <= calcIndex { break }
        let curChar = S[S.index(S.startIndex, offsetBy: index)]
        let curStartPos = charPos[Int(curChar.asciiValue! - asciiLowerA)][0] - startIndex
        if calcIndex > curStartPos {
            calcIndex = curStartPos
        }
    }
    let lastPartedLength = length - calcIndex
    if result[0] + lastPartedLength != length {
        result.append(contentsOf: partitioning(String(S.dropLast(lastPartedLength).dropFirst(result[0])), startIndex + result[0], charPos))
    }
    
    result.append(lastPartedLength)
    return result
}
