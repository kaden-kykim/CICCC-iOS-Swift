//
//  repeatingSequence.swift
//  GraphAssignments
//
//  Created by Kaden Kim on 2020-02-29.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

let NUM_UPPER_BOUND = ((pow(9, 5) * 4) as NSDecimalNumber).intValue

func repeatingSequence() -> [Int] {
    let stdin = readLine()!.split(separator: " ")
    let startNum = Int(stdin[0])!, powerOf = Int(stdin[1])!
    
    var outputs = [Int]()
    var checkInSequence = [Int](repeating: -1, count: NUM_UPPER_BOUND + 1)
    var index = 0
    var number = startNum
    while checkInSequence[number] == -1 {
        checkInSequence[number] = index
        let strNum = String(number)
        number = 0
        for digit in strNum {
            let digitVal = Int(String(digit))!
            var powered = 1
            for _ in 0..<powerOf {
                powered *= digitVal
            }
            number += powered
        }
        index += 1
    }
    outputs.append(checkInSequence[number])
    print(outputs[0])
    return outputs
}
