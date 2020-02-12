//
//  Evaluation.swift
//  Recursion
//
//  Created by Kaden Kim on 2020-02-11.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

/**
 5. Evaluation
 
 Write a recursive function evaluate that accepts a string
 representing a math expression and computes its value.
 - The expression will be "fully parenthesized" and will consist of + and * on single-digit integers only.
 - You can use a helper function. (Do not change the original function header)
 - Recursion
 
 evaluate("7")                            -> 7
 evaluate("(2+2)")                      -> 4
 evaluate("(1+(2*4))")                -> 9
 evaluate("((1+3)+((1+2)*5))")   -> 19
 */
func evaluate(_ expression: String) -> Int? {
    do {
        var expr = "(\(expression.replacingOccurrences(of: " ", with: "")))"
        let retVal = try recursiveEvaluate(&expr)
        return retVal
    } catch let error {
        print("Error: \(error.localizedDescription)")
    }
    return nil
}

func recursiveEvaluate(_ expression: inout String) throws -> Int {
    if (expression.starts(with: "(")) {
        expression.remove(at: expression.startIndex)
        
        var lhsStr = String(), rhsStr = String()
        var op: Character?
        
        while !expression.isEmpty {
            if expression.starts(with: "(") {
                let val = try String(recursiveEvaluate(&expression))
                (op == nil) ? (lhsStr = val) : (rhsStr = val)
            } else {
                let char = expression.remove(at: expression.startIndex)
                if char == ")" {
                    guard let lValue = Int(lhsStr) else { throw EvaluateError.NumberFormat }
                    if op == nil {
                        return lValue
                    } else {
                        guard let rValue = Int(rhsStr) else { throw EvaluateError.NumberFormat }
                        switch op {
                        case "+":
                            return lValue + rValue
                        case "*":
                            return lValue * rValue
                        default:
                            throw EvaluateError.UnsupportedOperator
                        }
                    }
                } else {
                    if char >= "0" && char <= "9" {
                        (op == nil) ? (lhsStr.append(char)) : (rhsStr.append(char))
                    } else {
                        if (op == nil) { op = char } else { throw EvaluateError.ExpressionFormat }
                    }
                }
            }
        }
        throw EvaluateError.ExpressionFormat
    } else {
        throw EvaluateError.ExpressionFormat
    }
}

enum EvaluateError : Error {
    case NumberFormat, ExpressionFormat, UnsupportedOperator, Unknown
}

extension EvaluateError : LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .NumberFormat:
            return "Number Format"
        case .ExpressionFormat:
            return "Expression Format"
        case .UnsupportedOperator:
            return "Unsupported Operator"
        default:
            return "Unknown"
        }
    }
}
