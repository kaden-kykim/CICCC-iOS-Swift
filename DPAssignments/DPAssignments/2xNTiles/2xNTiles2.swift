//
//  2xNTiles2.swift
//  DPAssignments
//
//  Created by Kaden Kim on 2020-03-13.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

func get2xNTiles2(_ n: Int) -> Int {
    var dp = [Int](repeating: -1, count: n + 1)
    if n < 2 { return 1 }
    dp[0] = 1
    dp[1] = 1
    for i in 2...n {
        dp[i] = dp[i - 1] + dp[i - 2] * 2
    }
    return dp[n]
}
