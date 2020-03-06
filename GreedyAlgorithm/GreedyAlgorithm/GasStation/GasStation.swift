//
//  GasStation.swift
//  GreedyAlgorithm
//
//  Created by Kaden Kim on 2020-03-05.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
    let count = gas.count
    let gasSum = gas.reduce(0, +), costSum = cost.reduce(0, +)
    if gasSum < costSum {
        return -1
    }
    var accumulatedVal = [Int]()
    accumulatedVal.append(gas[0] - cost[0])
    var min = accumulatedVal[0], minIndex = 0
    
    for i in 1..<count {
        accumulatedVal.append(accumulatedVal[i - 1] + (gas[i] - cost[i]))
        if accumulatedVal[i] < min {
            min = accumulatedVal[i]
            minIndex = i
        }
    }
    
    return (minIndex + 1) % count
}
