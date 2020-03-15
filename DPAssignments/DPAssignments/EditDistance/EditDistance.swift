//
//  EditDistance.swift
//  DPAssignments
//
//  Created by Kaden Kim on 2020-03-15.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

func minDistance(_ word1: String, _ word2: String) -> Int {
    let col = word1.count, row = word2.count
    var levArray = [[Int]](repeating: [Int](repeating: 0, count: col + 1), count: row + 1)
    for i in 0...col { levArray[0][i] = i }
    for i in 0...row { levArray[i][0] = i }
    
    for r in 0..<row {
        for c in 0..<col {
            let sCost = word1[word1.index(word1.startIndex, offsetBy: c)] != word2[word2.index(word2.startIndex, offsetBy: r)]
            levArray[r + 1][c + 1] = min(levArray[r][c + 1] + 1, levArray[r + 1][c] + 1, levArray[r][c] + ((sCost) ? 1 : 0))
        }
    }
    
    return levArray[row][col]
}
