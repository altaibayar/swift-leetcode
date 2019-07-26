//
//  17.swift
//  LeetCodeTest
//
//  Created by Altai Tseveenbayar on 2019-07-26.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_17: ProblemProtocol {

    let combinations: [Character: [String]] = [
        "1": [""],
        "2": ["a", "b", "c"],
        "3": ["d", "e", "f"],
        "4": ["g", "h", "i"],
        "5": ["j", "k", "l"],
        "6": ["m", "n", "o"],
        "7": ["p", "q", "r", "s"],
        "8": ["t", "u", "v"],
        "9": ["w", "x", "y", "z"]
    ]
    
    func rec(_ digits: String, index: Int, result: String) -> [String] {
        guard index < digits.count else { return result.isEmpty ? [ ] : [ result ] }
        
        var caches: [String] = [String]()
        
        let idx = digits.index(digits.startIndex, offsetBy: index)
        let combs = combinations[digits[idx]]!
        
        for ch in combs {
            let newResult = result.appending(ch)
            let cache = rec(digits, index: index + 1, result: newResult)
            caches.append(contentsOf: cache)
        }

        return caches
    }
    
    func letterCombinations(_ digits: String) -> [String] {
        return rec(digits, index: 0, result: "")
    }
    
    func run() {
        print(letterCombinations(""))
        print(letterCombinations("73"))
        print(letterCombinations("23"))
        print(letterCombinations("123"))
    }
}
