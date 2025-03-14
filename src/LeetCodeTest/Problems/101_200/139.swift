//
//  139.swift
//  LeetCodeTest
//
//  Created by a on 14/03/2025.
//  Copyright © 2025 tsevealt. All rights reserved.
//

class Problem_139: ProblemProtocol {
    
    func dp(chars: [Character], wordDic: Set<String>, memo: inout [Bool?], i: Int) -> Bool {
        guard i >= 0 else {  return true }
        
        if let m = memo[i] {
            return m
        }
        
        for word in wordDic {
            if i - word.count + 1 < 0 {
                continue
            }
            
            if chars.equal(to: word, from: i - word.count + 1)
                && dp(chars: chars, wordDic: wordDic, memo: &memo, i: i - word.count)
            {
                memo[i] = true
                return true
            }
        }
        
        memo[i] = false
        return false
    }
    
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let chars = Array(s)
        var memo = Array(repeating: Optional<Bool>(nil), count: chars.count)


        return dp(chars: chars, wordDic: Set(wordDict), memo: &memo, i: chars.count - 1)
    }
    
    func run() {
        print(wordBreak("leetcode", ["leet", "code"])) // true
        print(wordBreak("applepenapple", ["apple","pen"])) // true
        print(wordBreak("catsandog", ["cats","dog","sand","and","cat"])) // false
    }
}

fileprivate extension Array where Element == Character {
    func equal(to word: String, from i: Int) -> Bool {
        for (j, ch) in word.enumerated() {
            if ch != self[i + j] { return false }
        }
        
        return true
    }
}
