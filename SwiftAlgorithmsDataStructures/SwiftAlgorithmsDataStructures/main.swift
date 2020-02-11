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

func printTimeConsumption(_ name: String, start: DispatchTime, end: DispatchTime) {
    print("\(name) Time Consumption: \(Double(end.uptimeNanoseconds - start.uptimeNanoseconds) / 1_000_000.0)ms")
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

let lengthOfArray = 10000
let targetArray = (1...lengthOfArray).map { _ in Int.random(in: 1...(2 * lengthOfArray)) }

var startTime = DispatchTime.now()
_ = insertionSort(targetArray, <)
var endTime = DispatchTime.now()
printTimeConsumption("Insertion Sort", start: startTime, end: endTime)

startTime = DispatchTime.now()
_ = selectionSort(targetArray, <)
endTime = DispatchTime.now()
printTimeConsumption("Selection Sort", start: startTime, end: endTime)

startTime = DispatchTime.now()
_ = bubbleSort(targetArray, <)
endTime = DispatchTime.now()
printTimeConsumption("Bubble Sort", start: startTime, end: endTime)

startTime = DispatchTime.now()
_ = mergeSort(targetArray, <)
endTime = DispatchTime.now()
printTimeConsumption("Merge Sort", start: startTime, end: endTime)

startTime = DispatchTime.now()
_ = quickSort(targetArray, <)
endTime = DispatchTime.now()
printTimeConsumption("Quick Sort", start: startTime, end: endTime)
