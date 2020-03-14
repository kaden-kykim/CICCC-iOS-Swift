//
//  SumOfSquareNumber2.swift
//  DPAssignments
//
//  Created by Kaden Kim on 2020-03-13.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

func sumOfSquaredNumbers2(_ N: Int) -> Int {
    var sqNums = [Int]()
    for sqrt in 1...N {
        let sqNum = sqrt * sqrt
        if sqNum < N {
            sqNums.append(sqNum)
        } else if sqNum == N {
            return 1
        } else {
            break
        }
    }
    
    var check = [Bool](repeating: false, count: N)
    var stage = 1
    var subtracts = [Int]()
    subtracts.append(N)
    while true {
        var curSub = [Int]()
        for curNum in subtracts {
            for sqNum in sqNums {
                let subNum = curNum - sqNum
                if subNum > 0 && !check[subNum] {
                    check[subNum] = true
                    curSub.append(subNum)
                } else if subNum == 0 {
                    return stage
                }
            }
        }
        stage += 1
        subtracts = curSub
    }
}

func sumOfSquaredNumber(_ n: Int) -> Int {
    var dp = [Int](repeating: 0, count: n + 1)
    for i in 1...n {
        dp[i] = i
        var j = 1
        while j * j <= i {
            if dp[i] > dp[i - j * j] + 1 {
                dp[i] = dp[i - j * j] + 1
            }
            j += 1
        }
    }
    return dp[n]
}
