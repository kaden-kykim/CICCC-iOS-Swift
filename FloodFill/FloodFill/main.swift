//
//  main.swift
//  FloodFill
//
//  Created by Kaden Kim on 2020-02-27.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

let sizeOfTown = Int(readLine()!)!
var town = [[Bool]]()
for i in 0..<sizeOfTown {
    town.append([Bool].init(repeating: false, count: sizeOfTown))
    let row = readLine()!
    for (j, present) in row.enumerated() {
        town[i][j] = present == "1"
    }
}

findGroups(town)
