//
//  219.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 2019-01-27.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_219: ProblemProtocol {
    func run() {
        print(containsNearbyDuplicate([1,2,3,1], 3))
        print(containsNearbyDuplicate([1,0,1,1], 1))
        print(containsNearbyDuplicate([1,2,3,1,2,3], 2))
    }
    
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        
        var indexes = [Int: Int]()
        
        for (i, n) in nums.enumerated() {
            if let prev = indexes[n], i - prev <= k {
                return true
            }
            
            indexes[n] = i
        }
        
        return false
    }
}
