//
//  main.swift
//  GreedyAlgorithm
//
//  Created by Kaden Kim on 2020-03-04.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

// ## 01. Two City Scheduling
// 110
print(twoCitySchedCost([[10,20],[30,200],[400,50],[30,20]]))
// 3671
//print(twoCitySchedCost([[518,518],[71,971],[121,862],[967,607],[138,754],[513,337],[499,873],[337,387],[647,917],[76,417]]))
// 4723
//print(twoCitySchedCost([[70,311],[74,927],[732,711],[126,583],[857,118],[97,928],[975,843],[175,221],[284,929],[816,602],[689,863],[721,888]]))

// ## 02. Task Scheduler
// 8
print(leastInterval(["A","A","A","B","B","B"], 2))
// 4
//print(leastInterval(["A","B","A"], 2))
// 104
//print(leastInterval(["A","A","A","B","B","B"], 50))
// 16
//print(leastInterval(["A","A","A","A","A","A","B","C","D","E","F","G"], 2))

// ## 03. Gas Station
// 3
print(canCompleteCircuit([1,2,3,4,5], [3,4,5,1,2]))
// -1
//print(canCompleteCircuit([2,3,4], [3,4,3]))

// ## 04. Partition Labels
// [9, 7, 8]
print(partitionLabels("ababcbacadefegdehijhklij"))
// [1, 9]
//print(partitionLabels("caedbdedda"))

// ## 05. Course Schedule 3
// 3
print(scheduleCourse([[100, 200],[200, 1300],[1000, 1250],[2000, 3200]]))
//// 2
//print(scheduleCourse([[5,5],[4,6],[2,6]]))
//// 2
//print(scheduleCourse([[1,2],[2,3]]))
//// 4
//print(scheduleCourse([[7,16],[2,3],[3,12],[3,14],[10,19],[10,16],[6,8],[6,11],[3,13],[6,16]]))
//// 5
//print(scheduleCourse([[6,17],[5,17],[4,13],[6,17],[1,7],[1,11],[9,10],[4,4],[5,16]]))
//// 6
//print(scheduleCourse([[7,11],[1,11],[1,3],[2,6],[5,6],[7,7],[4,8],[2,20],[1,17],[8,11]]))
//// 4
//print(scheduleCourse([[7,17],[3,12],[10,20],[9,10],[5,20],[10,19],[4,18]]))
//// 4
//print(scheduleCourse([[4,8],[6,17],[1,14],[9,20],[8,11],[8,19],[6,19],[5,5],[5,6]]))
//// 4
//print(scheduleCourse([[10,12],[6,15],[1,12],[3,20],[10,19]]))
//// 12
//print(scheduleCourse([[860,4825],[13,1389],[746,8823],[455,2778],[233,2069],[106,5648],[802,2969],[958,2636],[567,2439],[623,1360],[700,4206],[9,3725],[241,7381]]))
//// 15
//print(scheduleCourse([[596,4958],[969,1919],[313,6227],[14,8197],[637,3529],[191,2008],[683,3678],[811,3901],[75,9109],[910,3060],[532,4488],[263,9183],[467,6092],[258,7176],[360,9992],[557,1438],[989,3947],[580,2679],[870,3254]]))
