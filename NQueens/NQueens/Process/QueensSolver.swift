//
//  QueensSolver.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2019-03-13.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import Foundation

/// Write a function solveQueens that accepts a Board as a parameter
/// and tries to place 8 queens on it safely.
///
/// - Your method should stop exploring if it finds a solution
/// - You are allowed to change the function header (args or return type)
/// - Your total recursive calls should not exceed 120 times.

var count = 0
var numOfAllPossibility = 0
func solveQueens(_ board: inout Board, row: Int = 0, findAllSolution: Bool = false) -> Bool {
    count += 1
    if row == board.size {
        if findAllSolution {
            print(board)
            numOfAllPossibility += 1
        }
        return true
    } else {
        for index in 0..<board.size {
            if board.isSafe(row: row, col: index) {
                board.place(row: row, col: index)
                if solveQueens(&board, row: row + 1, findAllSolution: findAllSolution) {
                    if !findAllSolution {
                        return true
                    }
                }
                board.remove(row: row, col: index)
            }
        }
    }
    return false
}
