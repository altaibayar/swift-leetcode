//
//  387.swift
//  LeetCodeTest
//
//  Created by Altai Tseveenbayar on 2019-07-17.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_387: ProblemProtocol {
    
    func firstUniqChar(_ s: String) -> Int {
        let aOffset = "a".first!.asciiValue!
        
        var count = Array<Int>(repeating: -1, count: 26)
        var indexes = Array<Int>(repeating: -1, count: 26)
        
        for (i, ch) in s.enumerated() {
            let idx = ch.asciiValue! - aOffset
            count[Int(idx)] += 1
        
            if indexes[Int(idx)] == -1 {
                indexes[Int(idx)] = i
            }
        }

        var result = Int.max
        for (c, i) in zip(count, indexes) {
            if c != 0 { continue }

            result = min(result, i)
        }
        
        return result == Int.max ? -1 : result
    }
    
    func run() {
        print(firstUniqChar(""))
        print(firstUniqChar("leetcode"))
        print(firstUniqChar("loveleetcode"))
    }
}
