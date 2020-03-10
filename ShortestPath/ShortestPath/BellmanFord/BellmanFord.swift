//
//  BellmanFord.swift
//  ShortestPath
//
//  Created by Kaden Kim on 2020-03-10.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

class BellmanFord {
    struct Edge {
        let from: Int
        let to: Int
        let cost: Int
    }
    
    /// General Bellman Ford Algorithm
    /// Time Complexity: O(V*E), worst case: O(V^3): (Complete Graph, E <= V^2)
    /// - Parameters:
    ///   - edges: the edge list
    ///   - N: the number of vertices (from 1 to N)
    ///   - source: the source vertex
    func bellmanFord(_ edges: [Edge], _ N: Int, _ source: Int) {
        var dist = [Int](repeating: Int.max, count: N + 1)
        dist[source] = 0
        for _ in 0..<N - 1 {
            for edge in edges {
                let from = edge.from
                let to = edge.to
                let cost = edge.cost
                let curCost = dist[from] + cost
                if dist[to] > curCost {
                    dist[to] = curCost
                }
            }
        }
        print(dist)
    }
    
    /// Faster Shortest Path Algorithm
    /// If a distance to a vertex changes, you keep it in the Queue.
    /// We use check array to see whether a vertex is in the Queue or not.
    /// Time Complexity: O(E) on average
    /// - Parameters:
    ///   - adj: the adjacency list
    ///   - N: the number of vertices
    ///   - source: the source vertex
    func shortestPathFasterAlgorithm(_ adj: [[Edge]], _ N: Int, _ source: Int) {
        var check = [Bool](repeating: false, count: N + 1)
        var dist = [Int](repeating: Int.max, count: N + 1)
        let q = Queue<Int>()
        q.enqueue(item: source)
        dist[source] = 0
        check[source] = true
        
        while !q.isEmpty() {
            let from = q.dequeue()!
            check[from] = false
            for edge in adj[from] {
                let cost = edge.cost
                let to = edge.to
                let curDist = dist[from] + cost
                if dist[to] > curDist {
                    dist[to] = curDist
                    if !check[to] {
                        q.enqueue(item: to)
                        check[to] = true
                    }
                }
            }
        }
    }
}
