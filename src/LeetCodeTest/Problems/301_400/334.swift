//
//  334.swift
//  LeetCodeTest
//
//  Created by a on 11/06/2024.
//  Copyright © 2024 tsevealt. All rights reserved.
//

import Foundation

class Problem_334: ProblemProtocol {
 
    func increasingTriplet(_ nums: [Int]) -> Bool {
        guard nums.count >= 3 else { return false }

        var first = Int.max, second = Int.max
        for n in nums {
            if n <= first {
                first = n
                
            } else if n <= second {
                second = n
 
            } else {
                return true
            }
        }
        
        return false
    }
    
    func run() {
        print(increasingTriplet([1,2,3,4,5]))
        print(increasingTriplet([5,4,3,2,1]))
        print(increasingTriplet([2,1,5,0,4,6]))
    }
}
