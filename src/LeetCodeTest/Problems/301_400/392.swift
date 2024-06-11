//
//  392.swift
//  LeetCodeTest
//
//  Created by a on 11/06/2024.
//  Copyright © 2024 tsevealt. All rights reserved.
//

import Foundation

class Problem_392: ProblemProtocol {

    func isSubsequence(_ s: String, _ t: String) -> Bool {
        guard !s.isEmpty else { return true }
        guard !t.isEmpty else { return false }
        
        var s1 = s.startIndex, s2 = s.index(before: s.endIndex)
        var t1 = t.startIndex, t2 = t.index(before: t.endIndex)

        while t1 <= t2 {
            
            if t[t1] == s[s1] {
                if s1 == s.index(before: s.endIndex) { return true }
                s1 = s.index(after: s1)
                
                if t1 == t.index(before: t.endIndex) { return false }
                t1 = t.index(after: t1)

            } else if t[t2] == s[s2] {
                if s2 == s.startIndex { return true }
                s2 = s.index(before: s2)
                
                if t2 == t.startIndex { return false }
                t2 = t.index(before: t2)

            } else {
                if t1 == t.index(before: t.endIndex) { return false }
                t1 = t.index(after: t1)
                
                if t2 == t.startIndex { return false }
                t2 = t.index(before: t2)
            }
            
            if s1 > s2 { return true }
        }
        
        return s1 > s2
    }
    
    func run() {
        print(isSubsequence("abc", "ahbgdc"))
        print(isSubsequence("axc", "ahbgdc"))
        print(isSubsequence("abc", ""))
        print(isSubsequence("b", "abc"))
        print(isSubsequence("b", "c"))
        print(isSubsequence("bcd", "uuuuuuuuuuuuuuuuuuuubcd"))
        print(isSubsequence("abbc", "ahbdc"))
    }
}

