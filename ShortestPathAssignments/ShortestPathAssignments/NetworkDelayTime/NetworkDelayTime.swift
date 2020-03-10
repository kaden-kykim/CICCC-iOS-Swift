//
//  NetworkDelayTime.swift
//  ShortestPathAssignments
//
//  Created by Kaden Kim on 2020-03-10.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

func networkDelayTime(_ times: [[Int]], _ N: Int, _ K: Int) -> Int {
    var adj = [[Edge]](repeating: [], count: N + 1)
    var dist = [Int](repeating: Int.max, count: N + 1)
    var check = [Bool](repeating: false, count: N + 1)
    
    for time in times {
        adj[time[0]].append(Edge(time[1], time[2]))
    }
    
    dist[K] = 0
    for _ in 0..<N - 1 {
        var min = Int.max
        var u = K
        for i in 1...N {
            if !check[i] && dist[i] < min {
                min = dist[i]
                u = i
            }
        }
        check[u] = true
        for edge in adj[u] {
            let v = edge.to
            let curCost = dist[u] + edge.cost
            if dist[v] > curCost {
                dist[v] = curCost
            }
        }
    }
    
    var maxDist = Int.min
    for i in 1...N {
        if maxDist < dist[i] {
            maxDist = dist[i]
        }
    }
    return (maxDist != Int.max) ? maxDist : -1
}

struct Edge {
    let to: Int
    let cost: Int
    
    init(_ to: Int, _ cost: Int) {
        self.to = to
        self.cost = cost
    }
}
