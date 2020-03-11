//
//  CheapestFlights.swift
//  ShortestPathAssignments
//
//  Created by Kaden Kim on 2020-03-10.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ K: Int) -> Int {
    var adj = [[Path]](repeating: [], count: n)
    var dist = [Int](repeating: Int.max, count: n)
    var check = [Bool](repeating: false, count: n)
    var stopDist = [[Int]](repeating: [Int](repeating: Int.max, count: n), count: n)
    
    for flight in flights {
        adj[flight[0]].append(Path(flight[1], flight[2]))
    }
    
    dist[src] = 0
    stopDist[src][0] = 0
    for _ in 0..<n - 1 {
        var min = Int.max
        var u = src
        for i in 0..<n {
            if !check[i] && dist[i] < min {
                min = dist[i]
                u = i
            }
        }
        
        check[u] = true
        for i in 0...K {
            if stopDist[u][i] != Int.max {
                for path in adj[u] {
                    let v = path.to
                    let curCost = stopDist[u][i] + path.cost
                    if i != K && stopDist[v][i + 1] > curCost {
                        stopDist[v][i + 1] = curCost
                    }
                    if dist[v] > curCost {
                        dist[v] = curCost
                    }
                }
            }
        }
    }
    
    return (dist[dst] != Int.max) ? dist[dst] : -1
}

struct Path {
    let to: Int
    let cost: Int
    
    init(_ to: Int, _ cost: Int) {
        self.to = to
        self.cost = cost
    }
}
