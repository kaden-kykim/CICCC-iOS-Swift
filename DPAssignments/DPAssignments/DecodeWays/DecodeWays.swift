//
//  DecodeWays.swift
//  DPAssignments
//
//  Created by Kaden Kim on 2020-03-14.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

func numDecodings(_ s: String) -> Int {
    let zeroAscii = Character("0").asciiValue!
    var dDecode = [Int]()
    var numDecode = 1
    var prevChInt = 0, secPrevChInt = 0
    for ch in s {
        let chInt = Int(ch.asciiValue! - zeroAscii)
        let dDecodeCount = dDecode.count
        if chInt >= 1 && chInt <= 6 && (prevChInt == 1 || prevChInt == 2) {
            numDecode += (dDecodeCount - 2 >= 0) ? dDecode[dDecodeCount - 2] : 1
        } else if chInt >= 7 && chInt <= 9 && prevChInt == 1 {
            numDecode += (dDecodeCount - 2 >= 0) ? dDecode[dDecodeCount - 2] : 1
        } else if chInt == 0 {
            if prevChInt != 1 && prevChInt != 2 {
                return 0
            } else if secPrevChInt == 1 || secPrevChInt == 2 {
                numDecode -= (dDecodeCount - 3 >= 0) ? dDecode[dDecodeCount - 3] : 1
            }
        }
        secPrevChInt = prevChInt
        prevChInt = chInt
        dDecode.append(numDecode)
    }
    return numDecode
}
