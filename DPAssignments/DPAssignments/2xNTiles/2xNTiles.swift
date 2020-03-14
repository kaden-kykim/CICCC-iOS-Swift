//
//  2xNTiles.swift
//  DPAssignments
//
//  Created by Kaden Kim on 2020-03-13.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

func get2xNTiles(_ n: Int) -> Int {
    var dp = [Int](repeating: -1, count: n + 1)
    if n < 3 { return n }
    dp[1] = 1
    dp[2] = 2
    for i in 3...n {
        dp[i] = dp[i - 1] + dp[i - 2]
    }
    return dp[n]
}
