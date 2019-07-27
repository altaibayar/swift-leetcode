//
//  22.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 2019-07-27.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_22: ProblemProtocol {

    func rec(rest: Int) -> [String] {
        if rest == 0 { return [ ] }
        else if rest == 1 { return ["()"] }

        let children = rec(rest: rest - 1)
        var result = [String]()
        for ch in children {
            result.append("(\(ch))")
            result.append("()\(ch)")
            result.append("\(ch)()")
        }

        return result
    }

    func generateParenthesis(_ n: Int) -> [String] {
        return Array(Set<String>( rec(rest: n) ))
    }

    func run() {
        let result = generateParenthesis(4)
        print(result)
        print(result.count)
    }
}
