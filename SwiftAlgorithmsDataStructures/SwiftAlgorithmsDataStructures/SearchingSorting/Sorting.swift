//
//  Sorting.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by Kaden Kim on 2020-02-10.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

private func swap<T>(_ collection: inout [T], _ index1: Int, _ index2: Int) {
    let tmp = collection[index1]
    collection[index1] = collection[index2]
    collection[index2] = tmp
}

func insertionSort<T : Comparable>(_ collection: [T], _ comparator: (T, T) -> Bool) -> [T] {
    var sortedCollection = collection
    for i in 0..<sortedCollection.count {
        for j in stride(from: i, to: 0, by: -1) {
            if comparator(sortedCollection[j], sortedCollection[j - 1]) {
                swap(&sortedCollection, j, j - 1)
            } else {
                break
            }
        }
    }
    
    return sortedCollection
}

func selectionSort<T : Comparable>(_ collection: [T], _ comparator: (T, T) -> Bool) -> [T] {
    var sortedCollection = collection
    var checkVal: T, checkIdx: Int
    for i in 0..<sortedCollection.count - 1 {
        checkVal = sortedCollection[i]
        checkIdx = i
        for j in i + 1..<sortedCollection.count {
            if comparator(sortedCollection[j], checkVal) {
                checkVal = sortedCollection[j]
                checkIdx = j
            }
        }
        swap(&sortedCollection, i, checkIdx)
    }
    return sortedCollection
}

func bubbleSort<T : Comparable>(_ collection: [T], _ comparator: (T, T) -> Bool) -> [T] {
    var sortedCollection = collection
    for i in stride(from: sortedCollection.count - 1, to: 0, by: -1) {
        var swapped = false
        for j in 0..<i {
            if comparator(sortedCollection[j + 1], sortedCollection[j]) {
                swap(&sortedCollection, j, j + 1)
                swapped = true
            }
        }
        if !swapped {
            break
        }
    }
    return sortedCollection
}

func mergeSort<T : Comparable>(_ collection: [T], _ comparator: (T, T) -> Bool) -> [T] {
    if collection.count <= 1 {
        return collection
    }
    
    let halfIndex = collection.count / 2
    var lArr = mergeSort(Array(collection[..<halfIndex]), comparator)
    var rArr = mergeSort(Array(collection[halfIndex...]), comparator)
    
    var sortedCollection = [T]()
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

func quickSort<T : Comparable>(_ collection: [T], _ comparator: (T, T) -> Bool) -> [T] {
    return []
}
