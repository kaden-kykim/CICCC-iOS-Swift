//
//  FindNElements.swift
//  GroupPresentation1
//
//  Created by Kaden Kim on 2020-02-23.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

class NPriorityQueue<T : Comparable> {
    let collection: [T]
    let comparator: (T, T) -> Bool
    let numOfElements: Int
    
    var count = 0
    var nPriorityQueue: [T?]
    
    init(_ collection: [T], _ comparator: @escaping (T, T) -> Bool, numOfElements: Int) {
        self.collection = collection
        self.comparator = comparator
        self.numOfElements = numOfElements
        self.nPriorityQueue = Array.init(repeating: nil, count: numOfElements)
        
        constructNPQueue()
    }
    
    func getPriorElements() -> [T] {
        let pQueue = nPriorityQueue
        let count = self.count
        var pElements = [T]()
        
        if count == 0 {
            return pElements
        }
        while self.count > 0 {
            pElements.insert(removePriorElement()!, at: 0)
        }
        
        self.nPriorityQueue = pQueue
        self.count = count
        return pElements
    }
    
    private func constructNPQueue() {
        for elem in collection {
            if count < numOfElements {
                insertElement(elem)
            } else {
                if comparator(elem, nPriorityQueue[0]!) {
                    _ = removePriorElement()
                    insertElement(elem)
                }
            }
        }
    }
    
    private func insertElement(_ element: T) {
        nPriorityQueue[count] = element
        upHeap(from: count)
        count += 1
    }
    
    private func removePriorElement() -> T? {
        let priorElem = nPriorityQueue[0]
        count -= 1
        nPriorityQueue[0] = nPriorityQueue[count]
        downHeap()
        return priorElem
    }

    private func upHeap(from insertedPos: Int) {
        var curPos = insertedPos
        while curPos != 0 {
            let parentPos = (curPos - 1) / 2
            if comparator(nPriorityQueue[parentPos]!, nPriorityQueue[curPos]!) {
                swap(curPos, parentPos)
                curPos = parentPos
            } else {
                break
            }
        }
    }
    
    private func downHeap() {
        var curPos = 0
        while curPos * 2 + 1 < count {
            let lChildPos = curPos * 2 + 1, rChildPos = curPos * 2 + 2
            let lChild = nPriorityQueue[lChildPos]!
            var priorChild: T, priorPos: Int
            if rChildPos < count {
                let rChild = nPriorityQueue[rChildPos]!
                let compare = comparator(lChild, rChild)
                priorChild = compare ? rChild : lChild
                priorPos = compare ? rChildPos : lChildPos
            } else {
                priorChild = lChild
                priorPos = lChildPos
            }
            if comparator(nPriorityQueue[curPos]!, priorChild) {
                swap(curPos, priorPos)
                curPos = priorPos
            } else {
                break
            }
        }
    }
    
    private func swap(_ index1: Int, _ index2: Int) {
        let temp = nPriorityQueue[index1]
        nPriorityQueue[index1] = nPriorityQueue[index2]
        nPriorityQueue[index2] = temp
    }
}
