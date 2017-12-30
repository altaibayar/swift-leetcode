//
//  3.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 30/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_3: ProblemProtocol {
    func run() {
        print(lengthOfLongestSubstring("abcabcbb"));
        print(lengthOfLongestSubstring("bbbbb"));
        print(lengthOfLongestSubstring("pwwkew"));
    }

    func lengthOfLongestSubstring(_ s: String) -> Int {
        var result = 0;

        var i = 0;
        var map = [String.Element: Int]();
        for (j, ch) in s.enumerated() {

            if let idx = map[ch] {
                i = max(i, idx);
            }

            result = max(result, j - i + 1);
            map[ch] = j + 1;
        }

        return result;
    }
}
