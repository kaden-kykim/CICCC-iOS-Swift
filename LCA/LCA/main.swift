//
//  main.swift
//  LCA
//
//  Created by Kaden Kim on 2020-02-20.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

let input = "15\n1 2\n1 3\n2 4\n3 7\n6 2\n3 8\n4 9\n2 5\n5 11\n7 13\n10 4\n11 15\n12 5\n14 7\n6\n6 11\n10 9\n2 6\n7 6\n8 13\n8 15"
let lcaTree = LCATree(input)
let lcaResults = lcaTree.getLCA()
for result in lcaResults {
    print(result)
}
