//
//  5.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 23/02/2018.
//  Copyright © 2018 tsevealt. All rights reserved.
//

import Foundation

class Problem_5: ProblemProtocol {
    func run() {
        print(longestPalindrome("cbba"));
        print(longestPalindrome("abababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababa"));
        print(longestPalindrome("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"));
    }

    func longestPalindrome(_ s: String) -> String {
        if s.count <= 1 { return s; }

        var result = "";
        var minJ = -1;
        var minK = -1;

        let characters = s.map { return $0; }
        let countMaxPal: (Int, Int) -> () = { j, k in
            var j = j;
            var k = k;

            while j >= 0 && k < s.count && characters[j] == characters[k] {
                if minK - minJ < k - j + 1 {
                    minJ = j;
                    minK = k;
                }

                j -= 1;
                k += 1;
            }
        }

        for i in 0 ..< s.count {

            //OPT1: if from the first half we have a result longer than a half
            if i > s.count / 2 && minJ - minK > s.count / 2 {
                break;
            }

            //even
            countMaxPal(i, i + 1);

            //odd
            countMaxPal(i, i);
        }

        if minJ >= 0 {
            let int2idx: (String, Int) -> String.Index = { s, i in
                return s.index(s.startIndex, offsetBy: i);
            }

            result = String( s[int2idx(s, minJ) ... int2idx(s, minK)]);
        }

        return result;
    }
}

