//
//  1004.swift
//  LeetCodeTest
//
//  Created by a on 28/02/2025.
//  Copyright © 2025 tsevealt. All rights reserved.
//

class Problem_1004: ProblemProtocol {
    func longestOnes(_ nums: [Int], _ k: Int) -> Int {
        var k = k

        var i = 0
        var j = 0
        
        while j < nums.count {
            if nums[j] == 0 {
                k -= 1
            }

            if k < 0 {
                if nums[i] == 0 {
                    k += 1
                }

                i += 1
            }

            j += 1
        }

        return j - i
    }
    
    func run() {
        print(longestOnes([1,1,1,0,0,0,1,1,1,1,0], 2))
        print(longestOnes([0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], 3))
    }
}
