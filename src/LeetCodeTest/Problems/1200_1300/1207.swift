//
//  1207.swift
//  LeetCodeTest
//
//  Created by a on 12/06/2024.
//  Copyright © 2024 tsevealt. All rights reserved.
//

import Foundation

class Problem_1207: ProblemProtocol {
    
    func uniqueOccurrences(_ arr: [Int]) -> Bool {
        var counts = [Int: Int]()
        for n in arr {
            counts[n, default: 0] += 1
        }
        
        return Set(counts.values).count == counts.count
    }
    
    func run() {
        print(uniqueOccurrences([1,2,2,1,1,3]))
        print(uniqueOccurrences([1,2]))
        print(uniqueOccurrences([-3,0,1,-3,1,1,1,-3,10,0]))
    }
}
