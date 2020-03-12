//
//  NonDecreasingDigits.swift
//  DPAssignments
//
//  Created by Kaden Kim on 2020-03-12.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

func nonDecreasingDigits(_ n: Int) -> Int {
    if n == 1 { return 10 }
    var result = 0
    for i in 0..<10 {
        result += (10 - i) * Int(pow(Double(i + 1), Double(n - 2)))
    }
    return result
}
