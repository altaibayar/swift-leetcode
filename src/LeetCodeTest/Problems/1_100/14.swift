//
//  14.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 09/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_14: ProblemProtocol {
    func run() {
        print(longestCommonPrefix(["a", "b"]));
    }

    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.count == 0 {
            return "";
        }

        var result = strs[0];
        for i in 1 ..< strs.count {

            while false == strs[i].starts(with: result) {
                result = String(result.dropLast());
            }
        }

        return result;
    }
}
