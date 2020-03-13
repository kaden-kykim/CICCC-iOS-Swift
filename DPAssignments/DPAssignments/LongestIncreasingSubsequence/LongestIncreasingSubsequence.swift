//
//  LongestIncreasingSubsequence.swift
//  DPAssignments
//
//  Created by Kaden Kim on 2020-03-12.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

func lengthOfLIS(_ nums: [Int]) -> Int {
    let revNums = nums.reversed()
    var smallest = Int.max
    var revCount = 0
    for num in revNums {
        if smallest > num {
            smallest = num
            revCount += 1
        }
    }
    
    var largest = Int.min
    var larger = Int.min
    var count = 0
    for num in nums {
        if larger < num && num < largest {
            larger = largest
            largest = num
        } else if largest < num {
            larger = largest
            largest = num
            count += 1
        }
    }
    
    return max(count, revCount)
}
