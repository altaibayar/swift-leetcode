//
//  31.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 2019-08-01.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_31: ProblemProtocol {

    func nextPermutation(_ nums: inout [Int]) {
        if nums.isEmpty || nums.count == 1 { return }
        if nums.count == 2 { nums.reverse(); return}

        var i = nums.count - 2
        while i >= 0 && nums[i + 1] <= nums[i] {
            i -= 1
        }

        if i >= 0 {
            var j = nums.count - 1
            while j >= 0 && nums[j] <= nums[i] {
                j -= 1
            }

            nums.swapAt(i, j)
        }

        reverse(&nums, from: i + 1)
    }

    func reverse(_ nums: inout [Int], from: Int) {
        var i = from
        var j = nums.count - 1
        while i < j {
            nums.swapAt(i, j)
            i += 1
            j -= 1
        }
    }

    func run() {
        var nums: [Int] = [1,2,3]
//        nextPermutation(&nums)
//        print(nums)
//
//        nums = [3,2,1]
//        nextPermutation(&nums)
//        print(nums)
//
//        nums = [1,1,5]
//        nextPermutation(&nums)
//        print(nums)
//
        nums = [1,5,1]
        nextPermutation(&nums)
        print(nums)
    }
}
