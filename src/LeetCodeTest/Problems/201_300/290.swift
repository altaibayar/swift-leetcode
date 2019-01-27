//
//  290.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 2019-01-27.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_290: ProblemProtocol {
    func run() {
        print(wordPattern("ab", "dog dog"))
//        print(wordPattern("abba", "dog cat cat dog"))
//        print(wordPattern("abba", "dog cat cat fish"))
//        print(wordPattern("aaaa", "dog cat cat dog"))
//        print(wordPattern("abba", "dog dog dog dog"))
    }
    
    func wordPattern(_ pattern: String, _ str: String) -> Bool {
        
        let words = str.split(separator: " ")
        guard words.count == pattern.count else { return false }

        var ch2w = [Character: String]()
        var w2ch = [String: Character]()
        
        for (ch, word) in zip(pattern, words) {
            
            if let w = ch2w[ch] {
                if w2ch[String(word)] != ch || w != word { return false }
            }
            
            if let c = w2ch[String(word)] {
                if ch2w[ch] != String(word) || c != ch { return false }
            }
            
            ch2w[ch] = String(word)
            w2ch[String(word)] = ch
        }
        
        return true
    }
}
