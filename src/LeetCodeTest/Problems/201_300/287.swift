//
//  287.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 2019-08-26.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_287: ProblemProtocol {

    func findDuplicate(_ nums: [Int]) -> Int {
        var idx1 = nums[0]
        var idx2 = nums[0]

        repeat {
            idx1 = nums[idx1]
            idx2 = nums[nums[idx2]]
        } while idx1 != idx2

        idx1 = nums[0]
        while idx1 != idx2 {
            idx1 = nums[idx1]
            idx2 = nums[idx2]
        }

        return idx1
    }

    func run() {
        print(findDuplicate([1,3,4,2,2]))
        print(findDuplicate([3,1,3,4,2]))
    }
}
