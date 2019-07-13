//
//  38.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 2019-07-13.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_38: ProblemProtocol {

    func rec(_ n: String) -> String {
        var count = 0
        var currentChar = n.first!
        var result = ""

        for ch in n {
            if ch == currentChar {
                count += 1
            } else {
                result.append("\(count)\(currentChar)")
                currentChar = ch
                count = 1
            }
        }
        if count > 0 {
            result.append("\(count)\(currentChar)")
        }

        return result
    }

    func countAndSay(_ n: Int) -> String {
        if n <= 0 { return "" }
        if n == 1 { return "1" }


        var result = "1"
        for _ in 2 ... n {
            result = rec(result)
        }

        return result
    }

    func run() {
        print(countAndSay(1))
        print(countAndSay(4))
    }
}
