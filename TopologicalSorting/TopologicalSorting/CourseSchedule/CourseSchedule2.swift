//
//  CourseSchedule2.swift
//  TopologicalSorting
//
//  Created by Kaden Kim on 2020-03-03.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

func findCourseSchedule() {
    print(Solution2().findOrder(4, [[1,0],[2,0],[3,1],[3,2]]))
}

class Solution2 {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        let numEdges = prerequisites.count
        var visited = [Bool](repeating: false, count: numCourses)
        var inDegree = [Int](repeating: 0, count: numCourses)
        var adjacents = [[Int]](repeating: [Int](), count: numCourses)
        var order = [Int]()
        
        for i in 0..<numEdges {
            let u = prerequisites[i][0], v = prerequisites[i][1]
            adjacents[v].append(u)
            inDegree[u] += 1
        }
        
        let queue = Queue2<Int>()
        for i in 0..<numCourses {
            if inDegree[i] == 0 {
                queue.enqueue(item: i)
            }
        }
        
        var visitedCount = 0
        while !queue.isEmpty() {
            let cur = queue.dequeue()!
            order.append(cur)
            if visited[cur] {
                return []
            }
            visited[cur] = true
            visitedCount += 1
            
            for adj in adjacents[cur] {
                inDegree[adj] -= 1
                if inDegree[adj] == 0 {
                    queue.enqueue(item: adj)
                }
            }
        }
        return (visitedCount == numCourses) ? order : []
    }
}

/// The Queue class represents a first-in-first-out (FIFO) queue of generic items.
/// It supports the usual *eunque* and *dequeue* operations, along with methods for peeking at the first item, testing if the queue is empty, and iterating through the items in FIFO order.
/// This implementation uses a singly linked list with an inner class for linked list nodes.
public final class Queue2<E> : Sequence {
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

extension Queue2: CustomStringConvertible {
    public var description: String {
        return self.reduce(into: "") { $0 += "\($1) " }
    }
}

