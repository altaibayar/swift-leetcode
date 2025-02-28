//
//  5.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 23/02/2018.
//  Copyright © 2018 tsevealt. All rights reserved.
//

import Foundation

class Problem_5: ProblemProtocol {
    func longestPalindrome(_ s: String) -> String {
        guard !s.isEmpty, s.count > 1 else { return s }
        
        var str = "#"
        for ch in s {
            str.append(ch)
            str.append("#")
        }
        
        let n = str.count
        var P = [Int](repeating: 0, count: n)
        var center = 0
        var radius = 0
        
        for i in 0 ..< n {
            let mirror = 2 * center - i
            
            if i < radius {
                P[i] = min(radius - i, P[mirror])
            }
            
            while
                i + 1 + P[i] < n &&
                i - 1 - P[i] >= 0 &&
                str[i + 1 + P[i]] == str[i - 1 - P[i]]
            {
                P[i] += 1
            }
            
            if i + P[i] > radius {
                center = i
                radius = i + P[i]
            }
        }
        
        var maxLength = 0
        var centerIndex = 0
        for i in 0 ..< n {
            if P[i] > maxLength {
                maxLength = P[i]
                centerIndex = i
            }
        }
        
        let startIndex = (centerIndex - maxLength) / 2
        let range =
        s.index(s.startIndex, offsetBy: startIndex) ..< s.index(s.startIndex, offsetBy: startIndex + maxLength)
        return String(s[range])
    }

    func run() {
        print(longestPalindrome("a"));
        print(longestPalindrome("babad"));
        print(longestPalindrome("cbbd"));

//        print(longestPalindrome("abababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababa"));
//        print(longestPalindrome("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"));
    }

}

fileprivate extension String {
    subscript (i: Int) -> Character {
        self[self.index(self.startIndex, offsetBy: i)]
    }
}
