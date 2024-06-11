//
//  1768.swift
//  LeetCodeTest
//
//  Created by a on 11/06/2024.
//  Copyright © 2024 tsevealt. All rights reserved.
//

import Foundation

class Problem_1768: ProblemProtocol {
    func mergeAlternately(_ word1: String, _ word2: String) -> String {
        var result: [Character] = []

        var i = 0, j = 0
        while i < word1.count || j < word2.count {
            if i < word1.count {
                result.append(word1[word1.index(word1.startIndex, offsetBy: i)])
                i += 1
            }
            
            if j < word2.count {
                result.append(word2[word2.index(word2.startIndex, offsetBy: j)])
                j += 1
            }
        }
                
        return String(result)
    }
    
    func run() {
        print(mergeAlternately("abc", "pqr"))
        print(mergeAlternately("ab", "pqrs"))
        print(mergeAlternately("abcd", "pq"))

    }
}
