//
//  Pokemon.swift
//  DPAssignments
//
//  Created by Kaden Kim on 2020-03-13.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

func maxCandies(_ N: Int, _ M: Int, _ gridCandies: [[Int]]) -> Int {
    var maxGrid = [[Int]](repeating: [Int](repeating: -1, count: M), count: N)
    maxGrid[N - 1][M - 1] = gridCandies[N - 1][M - 1]
    for row in stride(from: N - 1, through: 0, by: -1) {
        for col in stride(from: M - 1, through: 0, by: -1) {
            let candies = maxGrid[row][col], up = row - 1, left = col - 1
            if up >= 0 && maxGrid[up][col] < candies + gridCandies[up][col] {
                maxGrid[up][col] = candies + gridCandies[up][col]
            }
            if left >= 0 && maxGrid[row][left] < candies + gridCandies[row][left] {
                maxGrid[row][left] = candies + gridCandies[row][left]
            }
        }
    }
    
    return maxGrid[0][0]
}

func maxCandiesWrapper() -> Int {
    let gridSize = readLine()!.split(separator: " ").map { Int($0)! }
    var gridCandies = [[Int]]()
    for _ in 0..<gridSize[0] {
        gridCandies.append(readLine()!.split(separator: " ").map { Int($0)! })
    }
    return maxCandies(gridSize[0], gridSize[1], gridCandies)
}
