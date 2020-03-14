//
//  makeOne.swift
//  DPAssignments
//
//  Created by Kaden Kim on 2020-03-13.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

func makeOne(_ n: Int) -> Int {
    var dp = [Int](repeating: -1, count: n + 1)
    dp[1] = 0
    for i in 2...n {
        let div3 = (i % 3 == 0) ? dp[i / 3] : Int.max
        let div2 = (i % 2 == 0) ? dp[i / 2] : Int.max
        let minus1 = dp[i - 1]
        dp[i] = min(div3, div2, minus1) + 1
    }
    return dp[n]
}
