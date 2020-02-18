//
//  main.swift
//  NQueens
//
//  Created by Kaden Kim on 2020-02-18.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

var boardForAll = Board(size: 8)
_ = solveQueens(&boardForAll, findAllSolution: true)

var board = Board(size: 8)
count = 0
if solveQueens(&board) {
    print("Found solution with \(count) steps")
    print(board)
}
