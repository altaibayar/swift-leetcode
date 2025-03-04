//
//  523.swift
//  LeetCodeTest
//
//  Created by a on 04/03/2025.
//  Copyright © 2025 tsevealt. All rights reserved.
//

class Problem_523: ProblemProtocol {
    func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
        var prefixMod = 0
        var modSeen: [Int: Int] = [0: -1]
        
        for (i, n) in nums.enumerated() {
            prefixMod = (prefixMod + n) % k
            
            if let seenIdx = modSeen[prefixMod] {
                if (i - seenIdx >= 2) {
                    return true
                }
            } else {
                modSeen[prefixMod] = i
            }
        }
        
        return false
    }
    
    func run() {
        print(checkSubarraySum([23,2,4,6,7], 6))
        print(checkSubarraySum([23,2,6,4,7], 6))
    }
}
