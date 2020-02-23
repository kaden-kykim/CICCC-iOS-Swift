//
//  LowestCommonAncestor.swift
//  LCA
//
//  Created by Kaden Kim on 2020-02-20.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

class Node {
    var value: Int
    var parent: Node?
    var children: [Node]
    
    init(value: Int, parent: Node?) {
        self.value = value
        self.parent = parent
        self.children = [Node]()
    }
    
    func addChild(child: Node) {
        children.append(child)
    }
}

func lowestCommonAncestor(_ input: String) -> [Int] {
    var lines = input.split(separator: "\n")
    let numOfNode = Int(lines.remove(at: 0))
    for _ in 0..<numOfNode! {
        let values = lines.remove(at: 0).split(separator: " ")
        let value1 = Int(values[0])!, value2 = Int(values[1])!
        let parentVal = (value1 < value2) ? value1 : value2
        let childVal = (value1 < value2) ? value2 : value1
    }
    
    return [Int]()
}
