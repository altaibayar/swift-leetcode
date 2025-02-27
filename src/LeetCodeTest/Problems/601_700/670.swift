//
//  670.swift
//  LeetCodeTest
//
//  Created by a on 27/02/2025.
//  Copyright © 2025 tsevealt. All rights reserved.
//

class Problem_670: ProblemProtocol {
    func maximumSwap(_ num: Int) -> Int {
        var digits: [Int] = []
        var tmp = num
        while tmp > 0 {
            digits.insert(tmp % 10, at: 0)
            tmp /= 10
        }
        
        // build maxRightIdx
        var maxRightIdx = [Int](repeating: 0, count: digits.count)
        maxRightIdx[maxRightIdx.count - 1] = maxRightIdx.count - 1
        
        for i in stride(from: digits.count - 2, through: 0, by: -1) {
            maxRightIdx[i] = digits[i] > digits[maxRightIdx[i + 1]] ? i : maxRightIdx[i + 1]
        }
        
        //
        for (i, d) in digits.enumerated() {
            if d < digits[maxRightIdx[i]] {
                digits.swapAt(i, maxRightIdx[i])
                break
            }
        }
        
        //
        var result = 0
        for d in digits {
            result = result * 10 + d
        }
                
        return result
    }

    func run() {
        print(maximumSwap(2736))
        print(maximumSwap(9973))
        print(maximumSwap(98368))
    }
}
