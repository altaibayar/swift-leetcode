//
//  345.swift
//  LeetCodeTest
//
//  Created by a on 11/06/2024.
//  Copyright © 2024 tsevealt. All rights reserved.
//

import Foundation

class Problem_345: ProblemProtocol {
    
    func reverseVowels(_ s: String) -> String {
        guard !s.isEmpty else { return s }
        
        let vowels = Set<Character>(arrayLiteral: "a", "e", "i", "o", "u")
        
        var tmp: [Character] = s.map { $0 }
        var i = tmp.startIndex, j = tmp.endIndex.advanced(by: -1)
        
        let isVowel: (Character) -> Bool = { ch in
            vowels.contains(ch.lowercased())
        }
        
        while i < j {
            if isVowel(tmp[i]) && isVowel(tmp[j]) {                
                tmp.swapAt(i, j)
                
                i = tmp.index(after: i)
                j = tmp.index(before: j)
                
            } else if isVowel(tmp[i]) {
                j = tmp.index(before: j)
                
            } else if isVowel(tmp[j]) {
                i = tmp.index(after: i)
                
            } else {
                i = tmp.index(after: i)
                j = tmp.index(before: j)
            }
        }
                
        return String(tmp)
    }
 
    func run() {
        print(reverseVowels("hello"))
        print(reverseVowels("leetcode"))
    }
}
