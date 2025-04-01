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
        var count = [Int](repeating: 0, count: 26)
        var index = [Int](repeating: Int.max, count: 26)
        
        let ch_val: (Character) -> Int = { ch in
            return Int(ch.asciiValue! - Character("a").asciiValue!)
        }
        
        for (i, ch) in s.enumerated() {
            let idx = ch_val(ch)
            
            count[idx] += 1
            index[idx] = min(index[idx], i)
        }
        
        var result = Int.max
        for (cnt, idx) in zip(count, index) where cnt == 1 {
            result = min(result, idx)
        }
        
        return result == Int.max ? -1 : result
    }
    
    func _firstUniqChar(_ s: String) -> Int {
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
