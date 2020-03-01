//
//  CyclePermutation.swift
//  GraphAssignments
//
//  Created by Kaden Kim on 2020-02-29.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

func cyclePermutation() -> [Int] {
    let numOfCases = Int(readLine()!)!
    
    var numOfVerticesInCases = [Int]()
    var permutationsInCases = [[Int]]()
    var outputs = [Int]()
    
    for _ in 0..<numOfCases {
        let eachNumOfvertices = Int(readLine()!)!
        numOfVerticesInCases.append(eachNumOfvertices)
        let eachPermutations = readLine()!.split(separator: " ")
        var permutations = [Int]()
        for vertex in eachPermutations {
            permutations.append(Int(vertex)! - 1)
        }
        permutationsInCases.append(permutations)
    }
    
    for index in 0..<numOfCases {
        let numOfVertices = numOfVerticesInCases[index]
        let permutations = permutationsInCases[index]
        
        var visited = [Bool](repeating: false, count: numOfVertices)
        var visitingCount = 0
        var numOfCycle = 0
        
        while visitingCount < numOfVertices {
            var iterator = 0
            for i in 0..<numOfVertices {
                if !visited[i] { iterator = i }
            }
            while !visited[iterator] {
                visited[iterator] = true
                visitingCount += 1
                iterator = permutations[iterator]
            }
            numOfCycle += 1
        }
        outputs.append(numOfCycle)
    }
    
    for output in outputs { print(output) }
    
    return outputs
}
