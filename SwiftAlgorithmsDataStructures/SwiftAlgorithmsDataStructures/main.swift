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

let collection = [1, 2, 3, 4, 5, 6, 7, 8, 9]
let target1 = 10, target2 = 6

printSearchOutput(index: binarySearch(collection, target1), target: target1)
printSearchOutput(index: binarySearch(collection, target2), target: target2)
printSearchOutput(index: linearSearch(collection, target1), target: target1)
printSearchOutput(index: linearSearch(collection, target2), target: target2)

let unsortedArray = [4, 3, 8, 0, -2, 4, 7, 5]
print("Insertion Sort(ASC): \(insertionSort(unsortedArray, <))")
print("Insertion Sort(DESC): \(insertionSort(unsortedArray, >))")
print("Selection Sort(ASC): \(selectionSort(unsortedArray, <))")
print("Selection Sort(DESC): \(selectionSort(unsortedArray, >))")
print("Bubble Sort(ASC): \(bubbleSort(unsortedArray, <))")
print("Bubble Sort(DESC): \(bubbleSort(unsortedArray, >))")
print("Merge Sort(ASC): \(mergeSort(unsortedArray, <))")
print("Merge Sort(DESC): \(mergeSort(unsortedArray, >))")
print("Quick Sort(ASC): \(quickSort(unsortedArray, <))")
print("Quick Sort(DESC): \(quickSort(unsortedArray, >))")
