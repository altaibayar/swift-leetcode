//
//  443.swift
//  LeetCodeTest
//
//  Created by a on 11/06/2024.
//  Copyright © 2024 tsevealt. All rights reserved.
//

import Foundation

class Problem_443: ProblemProtocol {
    
    func compress(_ chars: inout [Character]) -> Int {
        guard chars.count >= 1 else { return chars.count }
        
        var j = chars.endIndex.advanced(by: -1)
        
        var current = 1
        while j > chars.startIndex {
            if chars[j] == chars[j.advanced(by: -1)] {
                current += 1
                chars.remove(at: j)
            } else {
                if (current > 1) {
                    chars.insert(contentsOf: String(current), at: j.advanced(by: 1))
                }
                
                current = 1
            }
            
            j = j.advanced(by: -1)
        }
        
        if (current > 1) {
            chars.insert(contentsOf: String(current), at: j.advanced(by: 1))
        }

        return chars.count
    }
    
    func run() {
        var arr1: [Character] = ["a","a","b","b","c","c","c"]
        print(compress(&arr1))
        print(arr1)

        var arr2: [Character] = ["a"]
        print(compress(&arr2))
        print(arr2)

        var arr3: [Character] = ["a","b","b","b","b","b","b","b","b","b","b","b","b"]
        print(compress(&arr3))
        print(arr3)
    }
}
