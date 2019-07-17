//
//  412.swift
//  LeetCodeTest
//
//  Created by Altai Tseveenbayar on 2019-07-17.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_412: ProblemProtocol {

    func fizzBuzz(_ n: Int) -> [String] {
        guard n > 0 else { return [] }
        
        var result = Array(repeating: "", count: n)
        for i in 1 ... n {
            
            if i % 3 == 0 {
                result[i - 1].append("Fizz")
            }
            
            if i % 5 == 0 {
                result[i - 1].append("Buzz")
            }
            
            if result[i - 1].isEmpty {
                result[i - 1] = "\(i)"
            }
        }
        
        return result
    }

    func run() {
        print(fizzBuzz(-1))
        print(fizzBuzz(0))
        print(fizzBuzz(15))
    }
}
