//
//  205.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 09/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_205: ProblemProtocol {
    func run() {
        print(isIsomorphic("egg", "add")); //true
        print(isIsomorphic("foo", "bar")); //false
        print(isIsomorphic("paper", "title")); //true
    }

    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        if s.count == 0 && t.count == 0 { return true; }
        if s.count != t.count { return false; }

        var mapping: [String.Element: String.Element] = [:];
        var usedLetters = Set<String.Element>();

        for (ch1, ch2) in zip(s, t) {

            if let newChar = mapping[ch1] {
                if newChar != ch2 {
                    return false;
                }
            } else {
                if usedLetters.contains(ch2) {
                    return false;
                } else {

                    mapping[ch1] = ch2;
                    usedLetters.insert(ch2);
                }
            }

        }

        return true;
    }
}
