//
//  448.swift
//  LeetCodeTest
//
//  Created by Altai Tseveenbayar on 2019-07-23.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_448: ProblemProtocol {
    
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var nums = nums
        for i in 0 ..< nums.count {
            if nums[i] != 0 {
                clean(&nums, nums[i] - 1)
            }
        }
        
        return nums
            .enumerated()
            .map { $0.1 > 0 ? $0.0 + 1 : 0 }
            .filter { $0 > 0}
    }
    
    func clean(_ nums: inout [Int], _ i: Int) {
        if nums[i] != 0 {
            let tmp = nums[i]
            nums[i] = 0
            clean(&nums, tmp - 1)
        }
    }
    
    func run() {
        print(findDisappearedNumbers([4, 3, 2, 7, 8, 2, 3, 1]))
    }
}
