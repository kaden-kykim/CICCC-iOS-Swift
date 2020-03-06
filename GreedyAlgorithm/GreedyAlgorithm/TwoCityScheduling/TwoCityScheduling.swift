//
//  TwoCityScheduling.swift
//  GreedyAlgorithm
//
//  Created by Kaden Kim on 2020-03-04.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

func twoCitySchedCost(_ costs: [[Int]]) -> Int {
    let halfCount = costs.count / 2
    var cities = [CostMap]()
    for (index, cost) in costs.enumerated() {
        let diff = cost[0] - cost[1]
        cities.append(CostMap(abs(diff), index, diff < 0))
    }
    cities = cities.sorted().reversed()
    
    var pplToA = [Int](), pplToB = [Int]()
    for i in 0..<costs.count {
        let curVal = cities[i]
        if pplToA.count >= halfCount {
            pplToB.append(curVal.index)
        } else if pplToB.count >= halfCount {
            pplToA.append(curVal.index)
        } else {
            if curVal.isCityA {
                pplToA.append(curVal.index)
            } else {
                pplToB.append(curVal.index)
            }
        }
    }
    
    var cost = 0
    for i in 0..<costs.count / 2 {
        cost += costs[pplToA[i]][0]
        cost += costs[pplToB[i]][1]
    }

    return cost
}

struct CostMap : Comparable {
    static func < (lhs: CostMap, rhs: CostMap) -> Bool {
        return lhs.cost < rhs.cost
    }
    
    let cost: Int
    let index: Int
    let isCityA: Bool
    
    init(_ cost: Int, _ index: Int, _ isCityA: Bool) {
        self.cost = cost
        self.index = index
        self.isCityA = isCityA
    }
}
