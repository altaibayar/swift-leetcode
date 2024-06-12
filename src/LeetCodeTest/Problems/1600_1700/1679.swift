//
//  1679.swift
//  LeetCodeTest
//
//  Created by a on 12/06/2024.
//  Copyright © 2024 tsevealt. All rights reserved.
//

import Foundation

class Problem_1679: ProblemProtocol {
 
    func maxOperations(_ nums: [Int], _ k: Int) -> Int {
        guard !nums.isEmpty else { return 0 }
                
        let sorted = nums.sorted()
        var i = sorted.startIndex
        var j = sorted.endIndex.advanced(by: -1)
        
        var result = 0
        
        while i < j {
            let sum = sorted[i] + sorted[j]
            if sum == k {
                result += 1
                i = i.advanced(by: 1)
                j = j.advanced(by: -1)
            } else if sum < k {
                i = i.advanced(by: 1)
            } else {
                j = j.advanced(by: -1)
            }
        }
        
        return result
    }
    
    func run() {
        print(maxOperations([1,2,3,4], 5))
        print(maxOperations([3,1,3,4,3], 6))
    }
}
