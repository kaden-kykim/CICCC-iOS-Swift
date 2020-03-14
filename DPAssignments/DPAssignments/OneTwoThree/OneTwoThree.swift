//
//  OneTwoThree.swift
//  DPAssignments
//
//  Created by Kaden Kim on 2020-03-13.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

func oneTwoThree(_ T: Int, _ n: [Int]) -> [Int] {
    let maxN = n.max()!
    var dp = [Int](repeating: -1, count: maxN + 1)
    if maxN < 3 { return n }
    dp[0] = 1
    dp[1] = 1
    dp[2] = 2
    for i in 3...maxN {
        dp[i] = dp[i - 1] + dp[i - 2] + dp[i - 3]
    }
    
    return n.map { dp[$0] }
}
