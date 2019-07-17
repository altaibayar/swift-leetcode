//
//  198.swift
//  LeetCodeTest
//
//  Created by Altai Tseveenbayar on 2019-07-17.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_198: ProblemProtocol {
    
    func rob(_ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }
        else if nums.count == 1 { return nums[0] }
        else if nums.count == 2 { return max(nums[0], nums[1]) }
        
        var maxes = Array<Int>(repeating: 0, count: nums.count)
        maxes[0] = nums[0]
        maxes[1] = max(nums[0], nums[1])
        
        for i in 2 ..< nums.count {
            maxes[i] = max(maxes[i - 1], nums[i] + maxes[i - 2])
        }

        return maxes.last!
    }
    
    func run() {
        print(rob([]))
        print(rob([1]))
        print(rob([1, 2]))
        print(rob([1, 2, 3]))
        print(rob([1, 2, 3, 1]))        // 4
        print(rob([2, 7, 9, 3, 1]))     // 12
        print(rob([2, 1, 1, 2]))        // 4
    }
}
