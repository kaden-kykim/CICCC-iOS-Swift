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

let lengthOfArray = 10
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

let numOfTestCase = 10
// Check if a Bag works well
print("================== Bag ==================")
var bag = Bag<Int>()
print("isEmpty: \(bag.isEmpty()), Count: \(bag.count)")
for index in 1...numOfTestCase {
    bag.add(item: index)
    print("isEmpty: \(bag.isEmpty()), Count: \(bag.count)")
    print("Item in Bag: \(bag)")
}

print("Check forEach method")
bag.forEach { item in
    print(item)
}

// Check if a Stack works well
print("================= Stack =================")
var stack = Stack<Int>()
print("isEmpty: \(stack.isEmpty()), Count: \(stack.count)")
if let peek = stack.peek() { print("Peek: \(peek)") }
for index in 1...numOfTestCase {
    stack.push(item: index)
    print("isEmpty: \(stack.isEmpty()), Count: \(stack.count)")
    if let peek = stack.peek() { print("Peek: \(peek)") }
    print("Item in Stack: \(stack)")
}
print("Check forEach method")
stack.forEach { item in
    print(item)
}

while !stack.isEmpty() {
    if let poppedValue = stack.pop() {
        print("Popped value: \(poppedValue)")
    }
}
print("isEmpty: \(stack.isEmpty()), Count: \(stack.count)")

// Check if a Queue works well
print("================= Queue =================")
var queue = Queue<Int>()
print("isEmpty: \(queue.isEmpty()), Count: \(queue.count)")
if let peek = queue.peek() { print("Peek: \(peek)")}

for index in 1...numOfTestCase {
    queue.enqueue(item: index)
    print("isEmpty: \(queue.isEmpty()), Count: \(queue.count)")
    if let peek = queue.peek() { print("Peek: \(peek)") }
    print("Item in Queue: \(queue)")
}

print("Check forEach method")
queue.forEach { item in
    print(item)
}

while !queue.isEmpty() {
    if let dequeuedValue = queue.dequeue() {
        print("Dequeued value: \(dequeuedValue)")
    }
}
print("isEmpty: \(queue.isEmpty()), Count: \(queue.count)")
print("=========================================")
