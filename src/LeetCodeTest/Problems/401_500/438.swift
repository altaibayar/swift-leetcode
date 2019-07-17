//
//  438.swift
//  LeetCodeTest
//
//  Created by Altai Tseveenbayar on 2019-07-17.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_438: ProblemProtocol {

    func thumbprint(str: String) -> String {
        var result = Array(repeating: 0, count: 26)
        let aOffset = "a".first!.asciiValue!

        for ch in str {
            let idx: Int = Int(ch.asciiValue! - aOffset)
            result[idx] += 1
        }
        
        return result.map { "\($0)" }.joined(separator: "_")
    }
    
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        guard p.count <= s.count, !s.isEmpty, !p.isEmpty else {
            return [ ]
        }

        var result = [Int]()
        
        let thumb = thumbprint(str: p)
        for i in 0 ..< s.count - p.count {
            let sub = s[i ... i + p.count]
            if thumb == thumbprint(str: sub) {
                result.append(i)
            }
            
        }
        
        return result
    }

    func run() {
        print(findAnagrams("", ""))
        print(findAnagrams("", "ab"))
        print(findAnagrams("cbaebabacd", "abc"))
        print(findAnagrams("abab", "ab"))
    }
}
