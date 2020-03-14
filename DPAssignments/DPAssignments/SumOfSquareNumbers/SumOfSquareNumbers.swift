//
//  SumOfSquareNumbers.swift
//  DPAssignments
//
//  Created by Kaden Kim on 2020-03-14.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

func judgeSquareSum(_ c: Int) -> Bool {
    let largestSqNum = Int(Double(c).squareRoot())
    for i in 0...largestSqNum {
        let rem = c - i * i
        let dRem = Double(rem).squareRoot()
        if dRem - Double(Int(dRem)) <= 0.0 {
            return true
        }
    }
    return false

// Time Limit Exceeded
//    let largestSqNum = Int(Double(c).squareRoot())
//    var sqNums = [Int]()
//    var checkSqNum = [Bool](repeating: false, count: c + 1)
//    for sqrt in 0...largestSqNum {
//        let sqNum = sqrt * sqrt
//        sqNums.append(sqNum)
//        checkSqNum[sqNum] = true
//        if sqNum == c {
//            return true
//        }
//    }
//
//    for sqNum in sqNums {
//        if checkSqNum[c - sqNum] { return true }
//    }
//
//    return false
}
