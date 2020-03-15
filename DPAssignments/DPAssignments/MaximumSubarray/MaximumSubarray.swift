//
//  MaximumSubarray.swift
//  DPAssignments
//
//  Created by Kaden Kim on 2020-03-14.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

func maxSubArray(_ nums: [Int]) -> Int {
    var integralNums = [Int]()
    var sum = 0
    for num in nums {
        sum += num
        integralNums.append(sum)
    }
    
    var max = Int.min, maxIndex = -1
    var min = 0, minIndex = -1
    var curMax = Int.min
    for i in 0..<nums.count {
        if min >= integralNums[i] {
            min = integralNums[i]
            minIndex = i
            max = integralNums[i]
            maxIndex = i
        } else if max < integralNums[i] {
            max = integralNums[i]
            maxIndex = i
        }
        
        var tmpMax: Int
        if minIndex < 0 {
            tmpMax = integralNums[maxIndex]
        } else if maxIndex <= minIndex {
            tmpMax = nums[minIndex]
        } else {
            tmpMax = integralNums[maxIndex] - integralNums[minIndex]
        }
        
        if curMax < tmpMax { curMax = tmpMax }
    }
    
    return curMax
}
