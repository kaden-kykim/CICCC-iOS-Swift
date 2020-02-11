//
//  Searching.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by Kaden Kim on 2020-02-10.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

// DocString: option + command + /

/// Linear Search Algorithm
/// Returns the index of the given target value from the collection
/// otherwise, nil
/// Time Complexity: O(N)
/// - Parameters:
///   - collection: An array of any equatable
///   - target: search target
func linearSearch<T : Equatable>(_ collection: [T], _ target: T) -> Int? {
    for (index, element) in collection.enumerated() where element == target {
        return index
    }
    return nil
}


/// IMPORTANT PRE-CONDITION: Elements must be sorted!
/// Binary Search Algorithm
/// Returns the index of the given target value from the collection
/// otherwise, nil
/// Time Complexity: O(lg N)
/// - Parameters:
///   - collection: An array of any comparable
///   - target: search target
func binarySearch<T : Comparable>(_ collection: [T], _ target: T) -> Int? {
    var lower = 0, upper = collection.count
    
    while lower < upper {
        let mid = (lower + upper) / 2
        let midVal = collection[mid]
        
        if midVal == target {
            return mid
        } else if midVal < target {
            lower = mid + 1
        } else {
            upper = mid - 1
        }
    }
    return nil
}
