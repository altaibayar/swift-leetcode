//
//  739.swift
//  LeetCodeTest
//
//  Created by a on 10/07/2024.
//  Copyright © 2024 tsevealt. All rights reserved.
//

import Foundation

class Problem_739: ProblemProtocol {
    func run() {
        print(dailyTemperatures([73,74,75,71,69,72,76,73]))
        print(dailyTemperatures([30,40,50,60]))
        print(dailyTemperatures([30,60,90]))
    }
     
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var result = Array(repeating: 0, count: temperatures.count)
        var stack = [Int]()
        
        for (i, t) in temperatures.enumerated() {
            while let s = stack.last, temperatures[s] < t {
                stack.removeLast()
                result[s] = i - s
            }
            
            stack.append(i)
        }
        
        return result
    }
}
