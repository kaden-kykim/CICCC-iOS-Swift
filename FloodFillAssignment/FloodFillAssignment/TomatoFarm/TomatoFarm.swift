//
//  TomatoFarm.swift
//  FloodFillAssignment
//
//  Created by Kaden Kim on 2020-02-29.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

func tomatoFarm() -> [Int] {
    let farmSize = readLine()!.split(separator: " ")
    let farmWidth = Int(farmSize[0])!, farmHeight = Int(farmSize[1])!
    
    var numOfTomatoes = farmWidth * farmHeight
    var ripeTomatoes = 0
    var tomatoFarm = [[Int]]()
    for _ in 0..<farmHeight {
        let cols = readLine()!.split(separator: " ")
        var row = [Int]()
        for col in cols {
            let colVal = Int(col)!
            row.append(colVal)
            if colVal == -1 {
                numOfTomatoes -= 1
            } else if colVal == 1 {
                ripeTomatoes += 1
            }
        }
        tomatoFarm.append(row)
    }

    var outputs = [Int]()
    var days = 0
    while ripeTomatoes < numOfTomatoes {
        let prevRipeTomatoes = ripeTomatoes
        var nextTomatoFarm = tomatoFarm
        for r in 0..<farmHeight {
            for c in 0..<farmWidth {
                if tomatoFarm[r][c] == 0 {
                    for dir in FarmPoint.directions {
                        let dr = r + dir.y, dc = c + dir.x
                        if dr >= 0 && dr < farmHeight && dc >= 0 && dc < farmWidth {
                            if tomatoFarm[dr][dc] == 1 {
                                nextTomatoFarm[r][c] = 1
                                ripeTomatoes += 1
                                break
                            }
                        }
                    }
                    if tomatoFarm[r][c] == 1 { break }
                }
            }
        }
        if prevRipeTomatoes == ripeTomatoes {
            days = -1
            break
        }
        tomatoFarm = nextTomatoFarm
        days += 1
    }
    
    print(days)
    outputs.append(days)
    return outputs
}

struct FarmPoint {
    static let directions = [FarmPoint(-1, 0), FarmPoint(0, -1), FarmPoint(0, 1), FarmPoint(1, 0)]
    var x: Int, y: Int
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
}
