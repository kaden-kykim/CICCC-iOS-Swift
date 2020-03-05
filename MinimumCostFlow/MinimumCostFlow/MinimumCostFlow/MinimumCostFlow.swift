//
//  MinimumCostFlow.swift
//  MinimumCostFlow
//
//  Created by Kaden Kim on 2020-03-04.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

func minimumCostFlow() -> [Int] {
    let preDefinedInputs = readLine()!.split(separator: " ").map { Int($0)! }
    
    let numOfBuildings = preDefinedInputs[0]
    let numOfPipes = preDefinedInputs[1]
    let enhancer = preDefinedInputs[2]
    
    var edges = [MCFEdge]()
    for i in 1...numOfPipes {
        edges.append(MCFEdge(readLine()!.split(separator: " ").map { Int($0)! }, i < numOfBuildings))
    }
    edges = edges.sorted()
    
    var unionFind = UF(numOfBuildings + 1)
    var numChangedEdges = 0
    var numActEdges = 0
    var lastWeight = 0
    var insertedIndex = 0
    for edge in edges {
        if !unionFind.connected(edge.u, edge.v) {
            unionFind.union(edge.u, edge.v)
            numActEdges += 1
            lastWeight = edge.weight
            if !edge.activated {
                numChangedEdges += 1
            }
        }

        if numActEdges >= numOfBuildings - 1 { break }
        insertedIndex += 1
    }
    
    if lastWeight < enhancer {
        if !edges[insertedIndex].activated {
            numChangedEdges -= 1
        }
    }
    
    print(numChangedEdges)
    var result = [Int]()
    result.append(numChangedEdges)
    return result
}

struct MCFEdge : Comparable {
    let u: Int, v: Int
    var weight: Int
    var activated: Bool
    
    init(_ input: [Int], _ activated: Bool) {
        self.u = input[0]
        self.v = input[1]
        self.weight = input[2]
        self.activated = activated
    }
    
    static func < (lhs: MCFEdge, rhs: MCFEdge) -> Bool {
        return lhs.weight < rhs.weight
    }
}

func mergeSort<T : Comparable>(_ collection: [T], _ comparator: (T, T) -> Bool) -> [T] {
    if collection.count <= 1 {
        return collection
    }
    
    let halfIndex = collection.count / 2
    var lArr = mergeSort(Array(collection[..<halfIndex]), comparator)
    var rArr = mergeSort(Array(collection[halfIndex...]), comparator)
    
    var sortedCollection: [T] = []
    while lArr.count != 0 && rArr.count != 0 {
        sortedCollection.append(comparator(lArr[0], rArr[0]) ? lArr.remove(at: 0) : rArr.remove(at: 0))
    }
    if lArr.count != 0 {
        sortedCollection.append(contentsOf: lArr)
    }
    if rArr.count != 0 {
        sortedCollection.append(contentsOf: rArr)
    }
    
    return sortedCollection
}

/// The UF struct represents a union-find (disjoint sets) data structure
/// It supports **union** and **find** operations, along with methods for
/// determining whether two nodes are in the same component and the total
/// number of components.
/// This implementation uses weighted quick union (by size or rank) with
/// full path compression.
/// Initializing a data structure with **n** nodes takes linear time.
/// Afterwards, **union**, **find**, and **connected** take logarithmic time
/// (in the worst case) and **count** takes constant time.
/// Moreover, the amortized time per **union**, **find**, and **connected** operation
/// has inverse Ackermann complexity (which is practically < 5 for 2^(2^(2^(2^16))) - undefined number).
public struct UF {
    /// parent[i] = parent of i
    private var parent: [Int]
    /// size[i] = number of nodes in tree rooted at i
    private var size: [Int]
    /// number of components
    private(set) var count: Int
    
    /// Initializes an empty union-find data structure with **n** elements
    /// **0** through **n-1**.
    /// Initially, each elements is in its own set.
    /// - Parameter n: the number of elements
    public init(_ n: Int) {
        self.count = n
        self.size = [Int](unsafeUninitializedCapacity: n) { (buffer, count) in
            for i in 0..<n {
                buffer[i] = 1
            }
            count = n
        }
        self.parent = [Int](unsafeUninitializedCapacity: n) { (buffer, count) in
            for i in 0..<n {
                buffer[i] = i
            }
            count = n
        }
    }
    
    /// Returns the canonical element(root) of the set containing element `p`.
    /// - Parameter p: an element
    /// - Returns: the canonical element of the set containing `p`
    public mutating func find(_ p: Int) -> Int {
        var root = p
        while root != parent[root] {
            parent[root] = parent[parent[root]]
            root = parent[root]
        }
        return root
    }
    
    /// Returns `true` if the two elements are in the same set.
    /// - Parameters:
    ///   - p: one elememt
    ///   - q: the other element
    /// - Returns: `true` if `p` and `q` are in the same set; `false` otherwise
    public mutating func connected(_ p: Int, _ q: Int) -> Bool {
        return find(p) == find(q)
    }
    
    /// Merges the set containing element `p` with the set containing
    /// element `q`
    /// - Parameters:
    ///   - p: one element
    ///   - q: the other element
    public mutating func union(_ p: Int, _ q: Int) {
        let i = find(p), j = find(q)
        if i == j {
            return
        } else if size[i] < size[j] {
            parent[i] = j
            size[j] += size[i]
        } else {
            parent[j] = i
            size[i] += size[j]
        }
    }
}
