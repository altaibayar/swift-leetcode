//
//  217.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 2019-01-27.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_217: ProblemProtocol {
    
    func run() {
        print(containsDuplicate([1,1,1,3,3,4,3,2,4,2]))
    }
    
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var set = Set<Int>()

        for n in nums {
            if set.contains(n) {
                return true
            }

            set.insert(n)
        }
        
        return false
    }
}
