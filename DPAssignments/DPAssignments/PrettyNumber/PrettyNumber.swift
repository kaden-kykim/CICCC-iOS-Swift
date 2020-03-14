//
//  PrettyNumber.swift
//  DPAssignments
//
//  Created by Kaden Kim on 2020-03-14.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

func prettyNumber(_ n: Int) -> Int {
    var dp = [[Int]]()
    dp.append([0, 1, 1, 1, 1, 1, 1, 1, 1, 1])
    for i in 1..<n {
        let prev = dp[i - 1]
        var cur = [Int](repeating: 0, count: 10)
        cur[0] = prev[1]
        for d in 1..<9 {
            cur[d] = prev[d - 1] + prev[d + 1]
        }
        cur[9] = prev[8]
        dp.append(cur)
    }
    
    return dp[n - 1].reduce(0, +)
}
