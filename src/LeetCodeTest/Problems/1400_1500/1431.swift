//
//  1431.swift
//  LeetCodeTest
//
//  Created by a on 11/06/2024.
//  Copyright © 2024 tsevealt. All rights reserved.
//

import Foundation

class Problem_1431: ProblemProtocol {
 
    func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
        let maxCandies = candies.max()!
        return candies.map { $0 + extraCandies >= maxCandies }
    }
    
    func run() {
        print(kidsWithCandies([2,3,5,1,3], 3))
        print(kidsWithCandies([4,2,1,1,2], 1))
        print(kidsWithCandies([12,1,12], 10))
    }
}
