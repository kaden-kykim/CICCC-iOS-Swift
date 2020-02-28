//
//  LowestCommonAncestor.swift
//  LCA
//
//  Created by Kaden Kim on 2020-02-20.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

class LCATree {
    let MAX_HEIGHT_LOG = Int(log2(Double(50_000)))
    
    let numOfNodes: Int
    var parents = [[Int]]()
    var nodes = [LCANode]()
    var queries = [String]()
    
    init() {
        numOfNodes = Int(readLine()!)!
        
        for _ in 0...MAX_HEIGHT_LOG {
            parents.append(Array.init(repeating: -1, count: numOfNodes))
        }
        
        for value in 0..<numOfNodes {
            nodes.append(LCANode(value: value))
        }
        
        for _ in 1..<numOfNodes {
            let values = readLine()!.split(separator: " ")
            let value1 = Int(values[0])! - 1, value2 = Int(values[1])! - 1
            nodes[value1].addAdjacent(nodes[value2])
            nodes[value2].addAdjacent(nodes[value1])
        }
        
        nodes[0].depth = 0
        preprocessDFS(nodes[0])
        
        for row in 1...MAX_HEIGHT_LOG {
            for col in 0..<numOfNodes {
                if parents[row - 1][col] != -1 {
                    parents[row][col] = parents[row - 1][parents[row - 1][col]]
                }
            }
        }
        
        for _ in 0..<Int(readLine()!)! {
            queries.append(readLine()!)
        }
    }
    
    func getLCA() -> [Int] {
        var result = [Int]()
        
        for query in queries {
            let values = query.split(separator: " ")
            var lowerValue = Int(values[0])! - 1, higherValue = Int(values[1])! - 1
            if nodes[lowerValue].depth < nodes[higherValue].depth {
                let temp = lowerValue
                lowerValue = higherValue
                higherValue = temp
            }
            
            var diffDepth = nodes[lowerValue].depth - nodes[higherValue].depth
            var rowIndex = 0
            while diffDepth != 0 {
                if diffDepth % 2 != 0 {
                    lowerValue = parents[rowIndex][lowerValue]
                }
                diffDepth /= 2
                rowIndex += 1
            }
            
            if lowerValue != higherValue {
                for index in stride(from: MAX_HEIGHT_LOG, through: 0, by: -1) {
                    if parents[index][lowerValue] != -1
                        && parents[index][lowerValue] != parents[index][higherValue] {
                        lowerValue = parents[index][lowerValue]
                        higherValue = parents[index][higherValue]
                    }
                }
                lowerValue = parents[0][lowerValue]
            }
            result.append(lowerValue + 1)
        }
        
        return result
    }
    
    private func preprocessDFS(_ currentNode: LCANode) {
        for adjacent in currentNode.adjacents {
            if adjacent.depth == -1 {
                parents[0][adjacent.value] = currentNode.value
                adjacent.depth = currentNode.depth + 1
                preprocessDFS(adjacent)
            }
        }
    }
}

class LCANode {
    var adjacents: [LCANode]
    var value: Int
    var depth = -1
    
    init(value: Int) {
        self.value = value
        self.adjacents = [LCANode]()
    }
    
    func addAdjacent(_ adjacent: LCANode) {
        adjacents.append(adjacent)
    }
}
