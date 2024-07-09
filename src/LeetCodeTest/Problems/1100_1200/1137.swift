//
//  1137.swift
//  LeetCodeTest
//
//  Created by a on 09/07/2024.
//  Copyright © 2024 tsevealt. All rights reserved.
//

import Foundation

class Problem_1137: ProblemProtocol {
    
    func run() {
        print(tribonacci(3))
    }
    
    func tribonacci(_ n: Int) -> Int {
        var cache: [Int] = [0, 1, 1]
        
        guard n > 0 else { return 0 }
        guard n >= cache.count else { return cache[n] }
        
        for i in 3 ... n {
            cache.append(cache[i - 1] + cache[i - 2] + cache[i - 3])
        }
        
        return cache.last!
    }
}
