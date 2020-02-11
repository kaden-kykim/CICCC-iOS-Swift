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
/// returns the index of the given target value from the collection
/// otherwise, nil
/// Time Complexity: O(N)
/// - Parameters:
///   - collections: An array of any equatable
///   - target: search target
func linearSearch<T : Equatable>(_ collections: [T], _ target: T) -> Int? {
    for (index, element) in collections.enumerated() where element == target {
        return index
    }
    return nil
}

func binarySearch<T : Comparable>(_ collections: [T], _ target: T) -> Int? {
    var lower = 0, upper = collections.count
    
    while lower < upper {
        let mid = (lower + upper) / 2
        let midVal = collections[mid]
        
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
