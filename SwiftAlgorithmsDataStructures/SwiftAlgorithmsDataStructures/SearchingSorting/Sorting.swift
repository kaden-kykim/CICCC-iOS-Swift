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
        var toInsert = i
        for j in stride(from: i - 1, through: 0, by: -1) {
            if comparator(sortedCollection[i], sortedCollection[j]) {
                toInsert = j
            } else {
                break
            }
        }
        if toInsert != i {
            sortedCollection.insert(sortedCollection.remove(at: i), at: toInsert)
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
    for i in 0..<sortedCollection.count - 1 {
        var swapped = false
        for j in 0..<sortedCollection.count - i - 1 {
            if comparator(sortedCollection[j + 1], sortedCollection[j]) {
                swap(&sortedCollection, j, j + 1)
                swapped = true
            }
        }
        if !swapped { break }
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

func quickSort<T : Comparable>(_ collection: [T], _ comparator: (T, T) -> Bool) -> [T] {
    if collection.count <= 1 {
        return collection
    }
    
    let pivotIndex = Int.random(in: 0..<collection.count)
    let pivotValue = collection[pivotIndex]
    var lArr: [T] = [], rArr: [T] = []
    for (index, element) in collection.enumerated() where index != pivotIndex {
        comparator(element, pivotValue) ? lArr.append(element) : rArr.append(element)
    }
    
    var sortedCollection: [T] = []
    sortedCollection.append(contentsOf: quickSort(lArr, comparator))
    sortedCollection.append(pivotValue)
    sortedCollection.append(contentsOf: quickSort(rArr, comparator))
    
    return sortedCollection
}
