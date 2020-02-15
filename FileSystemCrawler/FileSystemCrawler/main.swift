//
//  main.swift
//  FileSystemCrawler
//
//  Created by Kaden Kim on 2020-02-13.
//  Copyright © 2020 CICCC. All rights reserved.
//

import Foundation

let path = (CommandLine.argc == 1) ? "./" : CommandLine.arguments[1]
crawl(atPath: "\(path)/")
