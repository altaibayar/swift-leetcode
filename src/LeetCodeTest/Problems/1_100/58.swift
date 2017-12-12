//
//  58.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 09/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_58: ProblemProtocol {
    func run() {
        print(lengthOfLastWord("a "));
    }

    func lengthOfLastWord(_ s: String) -> Int {
        var result = 0;
        var tmp = s.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines);

        while tmp.count > 0 {
            if let last = tmp.last {
                if last == " " {
                    break;
                } else {
                    result += 1;
                }
            }

            tmp = String(tmp.dropLast());
        }

        return result;
    }
}
