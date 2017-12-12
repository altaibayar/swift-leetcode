//
//  20.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 09/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_20: ProblemProtocol {

    func run() {
        print(isValid("["))
        print(isValid("]"))
    }

    func isValid(_ s: String) -> Bool {
        var stack: [Character] = [];

        let pairs: [Character: Character] = [
            "}" : "{",
            "]" : "[",
            ")" : "("
        ];

        for i in 0 ..< s.count {
            let ch = s[s.index(s.startIndex, offsetBy: i)];

            if let expectedPair = pairs[ch] {
                if let last = stack.popLast() {
                    if expectedPair != last {
                        return false;
                    }
                } else {
                    return false;
                }

            } else {
                stack.append(ch);
            }
        }

        return stack.count == 0;
    }
}
