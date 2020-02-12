//
//  main.swift
//  Recursion
//
//  Created by Kaden Kim on 2020-02-11.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

print("Hello, World!")

func printEvaluation(_ expression: String) {
    if let val = evaluate(expression) {
        print("\(expression) = \(val)")
    }
}

printEvaluation("7")
printEvaluation("(2+2)")
printEvaluation("(1+(2*4))")
printEvaluation("((1+3)+((1+2)*5))")

printEvaluation("(11 + 25) * 3")
