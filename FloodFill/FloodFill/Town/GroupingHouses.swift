//
//  GroupingHouses.swift
//  FloodFill
//
//  Created by Kaden Kim on 2020-02-27.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

struct Point {
    var x: Int, y: Int
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
}

func findGroups(_ town: [[Bool]]) {
    let directions = [Point(-1, 0), Point(0, -1), Point(0, 1), Point(1, 0)]
    let sizeOfTown = town.count
    
    var checkVisited = [[Bool]]()
    var groups = [Int]()
    
    for _ in 0..<sizeOfTown {
        checkVisited.append([Bool].init(repeating: false, count: sizeOfTown))
    }
    
    for i in 0..<sizeOfTown {
        for j in 0..<sizeOfTown {
            if town[i][j] && !checkVisited[i][j] {
                let queue = Queue<Point>()
                checkVisited[i][j] = true
                groups.append(0)
                queue.enqueue(item: Point(i, j))
                while !queue.isEmpty() {
                    let iteratePoint = queue.dequeue()!
                    groups[groups.count - 1] += 1
                    
                    for dir in directions {
                        let dx = iteratePoint.x + dir.x, dy = iteratePoint.y + dir.y
                        if (dx >= 0 && dx < sizeOfTown && dy >= 0 && dy < sizeOfTown) {
                            if town[dx][dy] && !checkVisited[dx][dy] {
                                checkVisited[dx][dy] = true
                                queue.enqueue(item: Point(dx, dy))
                            }
                        }
                    }
                }
            }
        }
    }
    
    print(groups.count)
    groups.sort()
    for size in groups {
        print(size)
    }
}
