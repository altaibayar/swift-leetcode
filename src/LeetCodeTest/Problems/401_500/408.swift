//
//  408.swift
//  LeetCodeTest
//
//  Created by a on 03/03/2025.
//  Copyright © 2025 tsevealt. All rights reserved.
//

class Problem_408: ProblemProtocol {
    func validWordAbbreviation(_ word: String, _ abbr: String) -> Bool {
        let zero: UInt8 = "0".first!.asciiValue!

        if word.isEmpty && abbr.isEmpty { return true }
        else if word.isEmpty { return false }
        else if abbr.isEmpty { return false }

        var wordIdx = 0, abbrIdx = 0

        while wordIdx < word.count && abbrIdx < abbr.count {
            let ch = abbr[abbrIdx]
            
            if ch.isNumber {
                var currentNumber = 0
                
                while abbrIdx < abbr.count && abbr[abbrIdx].isNumber {
                    let abbrCh = abbr[abbrIdx]
                    if currentNumber == 0 && abbrCh == "0" {
                        return false
                    }
                    
                    currentNumber = currentNumber * 10 + Int(abbrCh.asciiValue! - zero)
                    abbrIdx += 1
                }
                
                wordIdx += currentNumber
            } else if ch.isLetter {
                if ch != word[wordIdx] { return false }
                
                wordIdx += 1
                abbrIdx += 1
            }
        }
        
        return wordIdx == word.count && abbrIdx == abbr.count
    }

    func run() {
        print(validWordAbbreviation("internationalization", "i12iz4n")) // true
        print(validWordAbbreviation("apple", "a2e")) // false
        print(validWordAbbreviation("abbde", "a1b01e"))
        print(validWordAbbreviation("a", "2"))
        print(validWordAbbreviation("hi", "hi1"))
        print(validWordAbbreviation("hi", "1"))
    }
}

fileprivate extension String {
    subscript(_ idx: Int) -> Character {
        self[index(startIndex, offsetBy: idx)]
    }
}
