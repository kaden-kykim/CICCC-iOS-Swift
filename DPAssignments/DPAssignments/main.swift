//
//  main.swift
//  DPAssignments
//
//  Created by Kaden Kim on 2020-03-12.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

// 1. Climbing Stairs
// 2
print(climbStairs(2))
// 3
//print(climbStairs(3))

// 2. Make One
// 1
print(makeOne(2))
// 3
//print(makeOne(10))

// 3. 2 x N Tiles
// 2
print(get2xNTiles(2))
// 55
//print(get2xNTiles(9))

// 4. 2 x N Tiles - 2
// 3
print(get2xNTiles2(2))
// 171
//print(get2xNTiles2(8))

// 5. One Two Three
// [7, 44, 274]
print(oneTwoThree(3, [4,7,10]))

// 6. Pretty Number
// 116
print(prettyNumber(5))
// 2986
//print(prettyNumber(10))

// 7. Non-decreasing Digits
// 220
print(nonDecreasingDigits(3))

// 8. LIS
// 4
print(lengthOfLIS([10,9,2,5,3,7,101,18]))
// 5
//print(lengthOfLIS([2,15,3,7,8,6,18]))

// 9. Sum of Square numbers
// true
print(judgeSquareSum(5))
// true
//print(judgeSquareSum(4))
// true
//print(judgeSquareSum(1))
// false
//print(judgeSquareSum(2147482647))

// 10. Sum of Square numbers - 2
// 4
print(sumOfSquaredNumbers2(7))
// 1
//print(sumOfSquaredNumbers2(1))
// 2
//print(sumOfSquaredNumbers2(18))
// 2
//print(sumOfSquaredNumbers2(2624))

// 11. Pokemon
// 31
print(maxCandies(3, 4, [[1,2,3,4],[0,0,0,5],[9,8,7,6]]))
// 3
//print(maxCandies(3, 3, [[1,0,0],[0,1,0],[0,0,1]]))
// 47
//print(maxCandies(4, 3, [[1,2,3],[6,5,4],[7,8,9],[12,11,10]]))

// 12. Decode Ways
// 2
print(numDecodings("12"))
// 3
//print(numDecodings("226"))
// 5
//print(numDecodings("1212"))
// 3
//print(numDecodings("12120"))

// 13. Maximum Subarray
// 6
print(maxSubArray([-2,1,-3,4,-1,2,1,-5,4]))
// -1
//print(maxSubArray([-2,-1]))
// 3
//print(maxSubArray([1,2]))

// 14. Text Justification
// ["This    is    an","example  of text","justification.  "]
print(fullJustify(["This", "is", "an", "example", "of", "text", "justification."], 16))
// ["What   must   be", "acknowledgment  ", "shall be        "]
//print(fullJustify(["What","must","be","acknowledgment","shall","be"], 16))

// 15. Edit Distance
// 3
print(minDistance("horse", "ros"))
// 5
//print(minDistance("intention", "execution"))
