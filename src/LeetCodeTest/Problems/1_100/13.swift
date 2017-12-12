//
//  13.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 09/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_13: ProblemProtocol {

    func run() {
        print(romanToInt("MCMLXXXVI"));
    }

    func romanToInt(_ s: String) -> Int {
        var result = 0;

        let vals: [Character: Int] =
        [
            "M": 1000,
            "D": 500,
            "C": 100,
            "L": 50,
            "X": 10,
            "V": 5,
            "I": 1
        ];

        var lastBiggest: Int = 0;

        for i in 0 ..< s.count {
            let ch = s[s.index(s.endIndex, offsetBy: -(i + 1))];

            if let val = vals[ch] {
                if val >= lastBiggest {
                    result += val;
                    lastBiggest = val;
                } else {
                    result -= val;
                }


            } else {
                fatalError("");
            }
        }

        return result;
    }
}
