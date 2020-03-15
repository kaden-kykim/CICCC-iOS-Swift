//
//  TextJustification.swift
//  DPAssignments
//
//  Created by Kaden Kim on 2020-03-15.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
    var wordsLength = [Int]()
    for word in words {
        wordsLength.append(word.count)
    }
    
    var result = [String]()
    var curPos = 0
    while curPos < words.count {
        let startPos = curPos
        var length = wordsLength[curPos]
        var lineLength = wordsLength[curPos]
        while curPos < words.count - 1 {
            length += wordsLength[curPos + 1] + 1
            if length > maxWidth {
                break
            } else {
                curPos += 1
                lineLength += wordsLength[curPos]
            }
        }
        
        let wordsInLine = curPos - startPos + 1
        var lineString = ""
        if wordsInLine == 1 || curPos == words.count - 1 {
            for i in startPos...curPos {
                lineString += words[i]
                if lineString.count < maxWidth { lineString += " " }
            }
            for _ in 0..<maxWidth - lineString.count { lineString += " " }
        } else {
            let blankLen = maxWidth - lineLength
            let divBlank = blankLen / (wordsInLine - 1)
            let remBlank = blankLen % (wordsInLine - 1)
//            print("curPos: \(curPos), startPos: \(startPos), WIL: \(wordsInLine), Blank: \(blankLen), Div: \(divBlank), Rem: \(remBlank)")
            for i in startPos..<curPos {
                lineString += words[i]
                for _ in 0..<divBlank { lineString += " " }
                if i - startPos < remBlank { lineString += " " }
            }
            lineString += words[curPos]
        }
        result.append(lineString)
        curPos += 1
    }
    
    return result
}
