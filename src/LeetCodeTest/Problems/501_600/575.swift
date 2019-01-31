//
//  575.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 2019-01-27.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_575: ProblemProtocol {
    func run() {
        print(distributeCandies([1, 1, 2, 2, 3, 3]))
        print(distributeCandies([1, 1, 2, 3]))
    }

    func distributeCandies(_ candies: [Int]) -> Int {
        let unique = Set<Int>(candies)
        return min(unique.count, candies.count / 2)
    }
}
