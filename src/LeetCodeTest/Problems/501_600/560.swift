//
//  560.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 2019-07-27.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_560: ProblemProtocol {

    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var dict = [Int: Int]()
        dict[0] = 1

        var result = 0
        var runningSum = 0

        for n in nums {
            runningSum += n

            if let storedVal = dict[runningSum - k] {
                result += storedVal
            }

            if let storedVal = dict[runningSum] {
                dict[runningSum] = storedVal + 1
            } else {
                dict[runningSum] = 1
            }
        }

//        print(dict)
        return result
    }

    func run() {
//        print(subarraySum([1, 1, 1], 2))
        print(subarraySum([1, 2, 1, 3], 3))
    }
}
