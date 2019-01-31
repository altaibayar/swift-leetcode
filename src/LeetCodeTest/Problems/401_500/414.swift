//
//  414.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 2019-01-27.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_414: ProblemProtocol {
    func run() {
        print(thirdMax([3, 2, 1]))
        print(thirdMax([1, 2]))
        print(thirdMax([2, 2, 3, 1]))
    }

    func thirdMax(_ nums: [Int]) -> Int {
        var max1 = Int.min, max2 = Int.min, max3 = Int.min

        for n in nums {
            if n == max1 || n == max2 || n == max3 {
                continue
            }

            if n > max1 {
                max3 = max2
                max2 = max1
                max1 = n
            } else if n > max2 {
                max3 = max2
                max2 = n
            } else if n > max3 {
                max3 = n
            }
        }

        return max3 == Int.min ? max1 : max3
    }
}
