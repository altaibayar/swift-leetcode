//
//  1732.swift
//  LeetCodeTest
//
//  Created by a on 12/06/2024.
//  Copyright © 2024 tsevealt. All rights reserved.
//

import Foundation

class Problem_1732: ProblemProtocol {
    
    func largestAltitude(_ gain: [Int]) -> Int {
        var result = 0
        
        var currentHeight = 0
        for n in gain {
            currentHeight += n
            if currentHeight > result {
                result = currentHeight
            }
        }
        
        return result
    }
    
    func run() {
        print(largestAltitude([-5,1,5,0,-7]))
        print(largestAltitude([-4,-3,-2,-1,4,3,2]))
    }
}
