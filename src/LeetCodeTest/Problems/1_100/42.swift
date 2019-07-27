//
//  42.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 2019-07-27.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_42: ProblemProtocol {

    func trap(_ height: [Int]) -> Int {

        var pool = Array(repeating: 0, count: height.count)

        var maxHeight = 0
        for i in 0 ..< height.count {
            if height[i] >= maxHeight {
                maxHeight = height[i]
            } else {
                pool[i] = maxHeight - height[i]
            }
        }

        maxHeight = 0
        for i in stride(from: height.count - 1, through: 0, by: -1) {
            if height[i] >= maxHeight {
                maxHeight = height[i]
                pool[i] = 0
            } else {
                let diff = maxHeight - height[i]
                pool[i] = min(diff, pool[i])
            }
        }

        return pool.reduce(0, +)
    }

    func run() {
        print(trap([ 0,1,0,2,1,0,1,3,2,1,2,1 ]))
    }
}
