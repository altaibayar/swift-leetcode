//
//  50.swift
//  LeetCodeTest
//
//  Created by a on 04/03/2025.
//  Copyright © 2025 tsevealt. All rights reserved.
//

class Problem_50: ProblemProtocol {
    func myPow(_ x: Double, _ n: Int) -> Double {
        guard n != 0 else {
            return 1
        }
        
        var x = x, n = n
        if n < 0 {
            n = -n
            x = 1.0 / x
        }
        
        var result = 1.0
        while n != 0 {
            if n % 2 == 1 {
                result *= x
                n -= 1
            }
            
            x *= x
            n /= 2
        }

        return result
    }

    func run() {
        print(myPow(2.00, 10)) // 1024.00000
        print(myPow(2.10, 3)) // 9.26100
        print(myPow(2.00, -2)) // 0.25
    }
}
