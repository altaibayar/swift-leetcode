//
//  46.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 2019-08-27.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_46: ProblemProtocol {

    func rec(current: [Int], rest: [Int], result: inout [[Int]]) {
        guard !rest.isEmpty else {
            result.append(current)
            return
        }

        for i in 0 ..< rest.count {
            var current = current
            current.append(rest[i])

            var rest = rest
            rest.remove(at: i)

            rec(current: current, rest: rest, result: &result)
        }
    }

    func permute(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        rec(current: [], rest: nums, result: &result)
        return result
    }

    func run() {
        let perm = permute([1, 2, 3])
        perm.forEach { print($0) }
    }
}
