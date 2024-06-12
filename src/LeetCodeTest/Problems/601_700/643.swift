//
//  643.swift
//  LeetCodeTest
//
//  Created by a on 12/06/2024.
//  Copyright © 2024 tsevealt. All rights reserved.
//

import Foundation

class Problem_643: ProblemProtocol {
    
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        guard nums.count >= k else { return 0 }
        
        var result: Double = -Double.infinity
        
        var currentSum: (Double, Int) = (0, 0)
        for (i, n) in nums.enumerated() {
            currentSum.0 += Double(n)
            currentSum.1 += 1

            if currentSum.1 > k {
                currentSum.1 -= 1
                currentSum.0 -= Double(nums[i - k])
            }
            
            if currentSum.1 == k && currentSum.0 / Double(k) > result {
                result = currentSum.0 / Double(k)
            }
        }
        
        return result
    }
    
    func run() {
        print(findMaxAverage([1,12,-5,-6,50,3], 4))
        print(findMaxAverage([5], 1))
        print(findMaxAverage([-1], 1))
    }
}
