//
//  main.swift
//  GroupPresentation1
//
//  Created by Kaden Kim on 2020-02-23.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

let text = "abacaabaccabacabaabb", pattern = "abacab"
print("Matching Index: \(KMPMatching(text, pattern: pattern))")

let lengthOfArray = 20
let targetArray = (1...lengthOfArray).map { _ in Int.random(in: 1...(5 * lengthOfArray)) }
print("Array: \(targetArray)")
var nPQueue = NPriorityQueue<Int>(targetArray, <, numOfElements: lengthOfArray / 2)
print("N Priority Elements: \(nPQueue.getPriorElements())")
