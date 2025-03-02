//
//  162.swift
//  LeetCodeTest
//
//  Created by a on 02/03/2025.
//  Copyright © 2025 tsevealt. All rights reserved.
//

class Problem_162: ProblemProtocol {
    func findPeakElement(_ nums: [Int]) -> Int {
        var mid = 0, i = 0, j = nums.count - 1
        
        while i < j {
            mid = (i + j) / 2
            if nums[mid] < nums[mid + 1] {
                i = mid + 1
            } else if nums[mid] > nums[mid + 1] {
                j = mid
            }
        }
     
        return i
    }
    
    func run() {
        print(findPeakElement([1])) // 0
        print(findPeakElement([1,2,3,1])) // 2
        print(findPeakElement([1,2,1,3,5,6,4])) // 5
    }
}
