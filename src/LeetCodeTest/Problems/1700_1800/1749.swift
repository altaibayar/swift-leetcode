//
//  1749.swift
//  LeetCodeTest
//
//  Created by a on 26/02/2025.
//  Copyright © 2025 tsevealt. All rights reserved.
//

class Problem_1749: ProblemProtocol {
    func maxAbsoluteSum(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        
        var minPrefix = 0, maxPrefix = 0
        
        var prefixSum = 0
        for i in 0 ..< nums.count {
            prefixSum += nums[i]
            
            minPrefix = min(minPrefix, prefixSum)
            maxPrefix = max(maxPrefix, prefixSum)
        }

        
        return maxPrefix - minPrefix
    }
    
    func run() {
        print(maxAbsoluteSum([1,-3,2,3,-4]))
        print(maxAbsoluteSum([2,-5,1,-4,3,-2]))
    }
}
