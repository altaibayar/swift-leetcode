//
//  208.swift
//  LeetCodeTest
//
//  Created by a on 09/07/2024.
//  Copyright © 2024 tsevealt. All rights reserved.
//

import Foundation

class Problem_208: ProblemProtocol {
    
    func run() {
        let trie = Trie()
        trie.insert("apple");
        print(trie.search("apple"))
        print(trie.search("app"))
        print(trie.startsWith("app"))
        trie.insert("app")
        print(trie.search("app"))
        
        print("Done")
    }
    
    class Trie {
        
        private class Node: CustomDebugStringConvertible {
            let char: Character
            
            var children: [Character: Node] = [:]
            var isEnd: Bool = false
            
            init(char: Character) {
                self.char = char
            }
            
            var debugDescription: String {
                return "Node \(char), children: \(children.count)"
            }
        }
        
        private var root = [Character: Node]()
        
        init() { }
        
        func insert(_ word: String) {
            guard !word.isEmpty else { return }
            
            // Find root
            if root[word.first!] == nil {
                let n = Node(char: word.first!)
                root[word.first!] = n
            }
            var current: Node = root[word.first!]!
            for ch in word[word.index(after: word.startIndex) ..< word.endIndex] {
                if current.children[ch] == nil{
                    current.children[ch] = Node(char: ch)
                }
                
                current = current.children[ch]!
            }
            
            current.isEnd = true
        }
        
        func search(_ word: String) -> Bool {
            find(word)?.isEnd ?? false
        }
        
        func startsWith(_ prefix: String) -> Bool {
            find(prefix) != nil
        }
        
        private func find(_ word: String) -> Node? {
            guard !word.isEmpty else { return nil }
            
            guard var current = root[word.first!] else {
                return nil
            }
            
            for ch in word[word.index(after: word.startIndex) ..< word.endIndex] {
                if let n = current.children[ch] {
                    current = n
                } else {
                    return nil
                }
            }
            
            return current
        }
    }
}

