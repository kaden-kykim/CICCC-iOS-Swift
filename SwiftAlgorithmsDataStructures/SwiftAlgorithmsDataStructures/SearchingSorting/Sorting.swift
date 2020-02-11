//
//  Sorting.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by Kaden Kim on 2020-02-10.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

func swap<T>(_ collection: inout [T], _ pos1: Int, _ pos2: Int) {
    let tmp = collection[pos1]
    collection[pos1] = collection[pos2]
    collection[pos2] = tmp
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
    return []
}

func bubbleSort<T : Comparable>(_ collection: [T], _ comparator: (T, T) -> Bool) -> [T] {
    return []
}

func quickSort<T : Comparable>(_ collection: [T], _ comparator: (T, T) -> Bool) -> [T] {
    return []
}

func mergeSort<T : Comparable>(_ collection: [T], _ comparator: (T, T) -> Bool) -> [T] {
    return []
}
