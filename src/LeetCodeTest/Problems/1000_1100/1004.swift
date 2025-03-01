//
//  1004.swift
//  LeetCodeTest
//
//  Created by a on 28/02/2025.
//  Copyright © 2025 tsevealt. All rights reserved.
//

class Problem_1004: ProblemProtocol {
    func longestOnes(_ nums: [Int], _ k: Int) -> Int {
        var result = 0
        
        var i = 0
        var j = 0
        
        var tmpK = 0
        while j < nums.count && tmpK < k{
            if nums[j] == 0 {
                tmpK += 1
                if tmpK == k { break }
            }
            
            j += 1
        }
        
        if result < j - i + 1 {
            result = j - i + 1
        }
        
        while j < nums.count {
            // move left
            i += 1
            while i < nums.count && nums[i] == 1 { i += 1 }
            
            // move right
            j += 1
            while j < nums.count && nums[j] == 1 { j += 1}
            
            if result < j - i + 1 {
                result = j - i + 1
            }
        }

        return result
    }
    
    func run() {
        print(longestOnes([1,1,1,0,0,0,1,1,1,1,0], 2))
        print(longestOnes([0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], 3))
    }
}
