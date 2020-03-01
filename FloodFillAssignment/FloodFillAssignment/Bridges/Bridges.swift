//
//  Bridges.swift
//  FloodFillAssignment
//
//  Created by Kaden Kim on 2020-02-29.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

func bridges() -> [Int] {
    let mapSize = Int(readLine()!)!
    var map = [[Int]]()
    for _ in 0..<mapSize {
        let row = readLine()!.split(separator: " ")
        var mapRow = [Int]()
        for block in row {
            mapRow.append(Int(block)!)
        }
        map.append(mapRow)
    }
    
    groupingMap(&map)
    let shortestLength = getShortestBridge(map)
    
    print(shortestLength)
    
    var outputs = [Int]()
    outputs.append(shortestLength)
    return outputs
}

fileprivate func getShortestBridge(_ inputMap: [[Int]]) -> Int {
    let mapSize = inputMap.count
    var map = inputMap
    var shortestLength = 0
    
    while true {
        var nextMap = map
        var candidate = 0
        
        for y in 0..<mapSize {
            for x in 0..<mapSize {
                if map[y][x] == 0 {
                    var nextIndex = 0
                    for dir in MapPoint.directions {
                        let dx = x + dir.x, dy = y + dir.y
                        if dx >= 0 && dx < mapSize && dy >= 0 && dy < mapSize {
                            let dIndex = map[dy][dx]
                            if dIndex != 0 {
                                if nextIndex == 0 || nextIndex == dIndex {
                                    nextIndex = dIndex
                                } else {
                                    return shortestLength + 1
                                }
                            }
                        }
                    }
                    if nextIndex != 0 {
                        for dir in MapPoint.directions {
                            let dx = x + dir.x, dy = y + dir.y
                            if dx >= 0 && dx < mapSize && dy >= 0 && dy < mapSize {
                                let nextDIndex = nextMap[dy][dx]
                                if nextDIndex != 0 && nextDIndex != nextIndex {
                                    candidate = shortestLength + 2
                                }
                            }
                        }
                    }
                    nextMap[y][x] = nextIndex
                }
            }
        }
        if candidate != 0 { return candidate }        
        map = nextMap
        shortestLength += 2
    }
}

fileprivate func groupingMap(_ map: inout [[Int]]) {
    let mapSize = map.count
    var visitedMap = [[Bool]](repeating: [Bool](repeating: false, count: mapSize), count: mapSize)
    var curIndex = 0
    for y in 0..<mapSize {
        for x in 0..<mapSize {
            if !visitedMap[y][x] && map[y][x] != 0 {
                curIndex += 1
                var stack = [MapPoint]()
                map[y][x] = curIndex
                stack.append(MapPoint(x, y))
                visitedMap[y][x] = true
                while stack.count != 0 {
                    let pop = stack.remove(at: stack.count - 1)
                    for dir in MapPoint.directions {
                        let dx = pop.x + dir.x, dy = pop.y + dir.y
                        if dy >= 0 && dy < mapSize && dx >= 0 && dx < mapSize {
                            if !visitedMap[dy][dx] && map[dy][dx] != 0 {
                                map[dy][dx] = curIndex
                                stack.append(MapPoint(dx, dy))
                                visitedMap[dy][dx] = true
                            }
                        }
                    }
                }
            }
        }
    }
}

struct MapPoint {
    static let directions = [MapPoint(-1, 0), MapPoint(0, -1), MapPoint(0, 1), MapPoint(1, 0)]
    var x: Int, y: Int
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
}
