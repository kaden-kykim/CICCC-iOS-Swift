//
//  SushiReviews.swift
//  SushiReviews
//
//  Created by Kaden Kim on 2020-02-28.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

let bfsQueue = Queue<Int>()

func sushiReviews() -> Int {
    let numOfSets = readLine()!.split(separator: " ")
    let numOfRestaurants = Int(numOfSets[0])!
    let realSushiList = readLine()!.split(separator: " ")
    
    var adjacents = [[Int]](repeating: [Int](), count: numOfRestaurants)
    var checkRealSushi = [Bool](repeating: false, count: numOfRestaurants)
    
    for real in realSushiList {
        checkRealSushi[Int(real)!] = true
    }
    
    for _ in 1..<numOfRestaurants {
        let vertices = readLine()!.split(separator: " ")
        let u = Int(vertices[0])!, v = Int(vertices[1])!
        adjacents[u].append(v)
        adjacents[v].append(u)
    }
    
    var startNode = 0, maxDist = 0
    (startNode, _) = getDistancesWithMaxIndex(from: startNode, checkRealSushi: &checkRealSushi, adjacents: adjacents)
    (startNode, _) = getDistancesWithMaxIndex(from: startNode, checkRealSushi: &checkRealSushi, adjacents: adjacents)
    (_, maxDist) = getDistancesWithMaxIndex(from: startNode, checkRealSushi: &checkRealSushi, adjacents: adjacents)
    print("\(startNode) \(maxDist)")
    
    var totalTime = 0
    var visited = [Bool](repeating: false, count: numOfRestaurants)
    _ = dfsForRealSushi(curNode: startNode, totalTime: &totalTime, &visited, checkRealSushi, adjacents)
    totalTime -= maxDist
    
    print("Total Time: \(totalTime)")
    return totalTime
}

fileprivate func dfsForRealSushi(curNode: Int, totalTime: inout Int, _ visited: inout [Bool],
                                 _ checkRealSushi: [Bool], _ adjacents: [[Int]]) -> Bool {
    visited[curNode] = true
    var hasRealSushi = checkRealSushi[curNode]
    
    for v in adjacents[curNode] {
        if !visited[v] {
            totalTime += 1
            let hasChildRealSushi = dfsForRealSushi(curNode: v, totalTime: &totalTime, &visited, checkRealSushi, adjacents)
            hasRealSushi = hasRealSushi || hasChildRealSushi
            if hasChildRealSushi {
                totalTime += 1
            } else {
                totalTime -= 1
            }
        }
    }
    
    return hasRealSushi
}

fileprivate func getDistancesWithMaxIndex(from root: Int, checkRealSushi: inout [Bool], adjacents: [[Int]]) -> (Int, Int) {
    let numOfNodes = adjacents.count
    var visited = [Bool](repeating: false, count: numOfNodes)
    var distances = [Int](repeating: 0, count: numOfNodes)
    clearBFSQueue()
    bfsQueue.enqueue(item: root)
    while !bfsQueue.isEmpty() {
        let curNode = bfsQueue.dequeue()!
        visited[curNode] = true
        for adj in adjacents[curNode] {
            if !visited[adj] {
                distances[adj] = distances[curNode] + 1
                bfsQueue.enqueue(item: adj)
            }
        }
    }
    
    var maxDist = 0, maxIndex = root
    for i in 0..<numOfNodes {
        if checkRealSushi[i] && (maxDist < distances[i]) {
            maxDist = distances[i]
            maxIndex = i
        }
    }
    return (maxIndex, maxDist)
}

fileprivate func clearBFSQueue() {
    while !bfsQueue.isEmpty() {
        _ = bfsQueue.dequeue()
    }
}

//
//  Queue.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by Derrick Park on 2/12/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

/// The Queue class represents a first-in-first-out (FIFO) queue of generic items.
/// It supports the usual *eunque* and *dequeue* operations, along with methods for peeking at the first item, testing if the queue is empty, and iterating through the items in FIFO order.
/// This implementation uses a singly linked list with an inner class for linked list nodes.
public final class Queue<E> : Sequence {
    /// beginning of queue
    private var first: Node<E>? = nil
    /// end of queue
    private var last: Node<E>? = nil
    /// size of the queue
    private(set) var count: Int = 0
    
    /// helper linked list node class
    fileprivate class Node<E> {
        fileprivate var item: E
        fileprivate var next: Node<E>?
        fileprivate init(item: E, next: Node<E>? = nil) {
            self.item = item
            self.next = next
        }
    }
    
    /// Initializes an empty queue.
    public init() {}
    
    /// Returns true if this queue is empty.
    public func isEmpty() -> Bool {
        return count == 0
    }
    
    /// Returns the item least recently added to this queue.
    public func peek() -> E? {
        return last?.item ?? nil
    }
    
    /// Adds the item to this queue
    /// - Parameter item: the item to add
    public func enqueue(item: E) {
        let newNode = Node.init(item: item)
        if let last = last { last.next = newNode }
        last = newNode
        if isEmpty() { first = self.last }
        count += 1
    }
    
    /// Removes and returns the item on this queue that was least recently added.
    public func dequeue() -> E? {
        guard let first = first else { return nil }
        self.first = first.next
        count -= 1
        return first.item
    }
    
    /// QueueIterator that iterates over the items in FIFO order.
    public struct QueueIterator<E> : IteratorProtocol {
        private var current: Node<E>?
        
        fileprivate init(_ first: Node<E>?) {
            current = first
        }
        
        public mutating func next() -> E? {
            if let current = current {
                self.current = current.next
                return current.item
            } else { return nil }
        }
        
        public typealias Element = E
    }
    
    /// Returns an iterator that iterates over the items in this Queue in FIFO order.
    public __consuming func makeIterator() -> QueueIterator<E> {
        return QueueIterator<E>(first)
    }
}

extension Queue: CustomStringConvertible {
    public var description: String {
        return self.reduce(into: "") { $0 += "\($1) " }
    }
}
