//
//  main.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by Kaden Kim on 2020-02-10.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

print("Hello, World!")

func printSearchOutput(index: Int?, target: Int) {
    if let index = index {
        print("Find \(target) at \(index)")
    } else {
        print("Cannot find \(target)")
    }
}

let collections = [1, 2, 3, 4, 5, 6, 7, 8, 9]
let target1 = 10, target2 = 6

printSearchOutput(index: binarySearch(collections, target1), target: target1)
printSearchOutput(index: binarySearch(collections, target2), target: target2)
printSearchOutput(index: linearSearch(collections, target1), target: target1)
printSearchOutput(index: linearSearch(collections, target2), target: target2)
