//
//  34.swift
//  LeetCodeTest
//
//  Created by a on 02/03/2025.
//  Copyright © 2025 tsevealt. All rights reserved.
//

class Problem_34: ProblemProtocol {
    
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        guard !nums.isEmpty else { return [-1, -1] }
        
        var mid = 0, i = 0, j = nums.count - 1
        while i <= j {
            mid = (i + j) / 2
            if nums[mid] == target {
                break
            } else if nums[mid] < target {
                i = mid + 1
            } else {
                j = mid - 1
            }
        }
     
        if nums[mid] != target {
            return [-1, -1]
        }
        
        i = mid
        while i >= 0 && nums[i] == target {
            i -= 1
        }
        
        j = mid
        while j < nums.count && nums[j] == target {
            j += 1
        }
        
        return [i + 1, j - 1]
    }

    func run() {
        print(searchRange([1, 4], 4))
        print(searchRange([5,7,7,8,8,10], 8))
        print(searchRange([5,7,7,8,8,10], 6))
        print(searchRange([], 0))
        print(searchRange([1], 1))
        print(searchRange([1,2,3,3,3,3,4,5,9], 3)) // [2, 5]
    }
}
