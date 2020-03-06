//
//  TaskScheduler.swift
//  GreedyAlgorithm
//
//  Created by Kaden Kim on 2020-03-05.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
    let asciiA = Character("A").asciiValue!
    var chTasks = [Int](repeating: 0, count: 26)
    for ch in tasks {
        chTasks[Int(ch.asciiValue! - asciiA)] += 1
    }
    
    var cpuTasks = [CPUTask]()
    for (index, chTask) in chTasks.enumerated() {
        if chTask != 0 {
            cpuTasks.append(CPUTask(index, chTask))
        }
    }
    
    var intervals = 0
    while !cpuTasks.isEmpty {
        var curIndex = -1, nextInterval = -1
        for i in 0..<cpuTasks.count {
            if nextInterval == -1 || cpuTasks[i].interval < nextInterval {
                nextInterval = cpuTasks[i].interval
            }
            if cpuTasks[i].isReady(intervals) {
                if curIndex == -1 || cpuTasks[curIndex].numTasks < cpuTasks[i].numTasks {
                    curIndex = i
                }
            }
        }
        
        if curIndex >= 0 {
            intervals += 1
            cpuTasks[curIndex].runTask(intervals + n)
            if cpuTasks[curIndex].isDone() {
                cpuTasks.remove(at: curIndex)
            }
        } else {
            intervals = nextInterval
        }
    }

    return intervals
}

struct CPUTask : Comparable {
    let id: Int
    var numTasks: Int
    var interval = 0
    
    init(_ name: Int, _ numTasks: Int) {
        self.id = name
        self.numTasks = numTasks
    }
    
    static func < (lhs: CPUTask, rhs: CPUTask) -> Bool {
        return lhs.numTasks > rhs.numTasks
    }
    
    func isReady(_ intervals: Int) -> Bool {
        return interval <= intervals
    }
    
    func isDone() -> Bool {
        return numTasks == 0
    }
    
    mutating func runTask(_ interval: Int) {
        numTasks -= 1
        self.interval = interval
    }
}
