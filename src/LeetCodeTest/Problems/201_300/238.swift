//
//  238.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 2019-09-08.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_238: ProblemProtocol {

    func productExceptSelf(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else { return nums }

        var result = Array(repeating: 1, count: nums.count)

        var current = nums[0]

        // left
        for i in 1 ..< nums.count {
            result[i] = current
            current *= nums[i]
        }

        // right
        current = nums.last!
        for i in stride(from: nums.count - 2, through: 0, by: -1) {
            result[i] *= current
            current *= nums[i]
        }

        return result
    }

    func run() {
        print(productExceptSelf([]))
        print(productExceptSelf([1]))
        print(productExceptSelf([1,2]))
        print(productExceptSelf([1,2,3,4]))
    }
}
