//
//  28.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 09/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_28: ProblemProtocol {
    func run() {
        print(strStr("hello", "ll"))
        print(strStr("aaaaa", "bba"))
        print(strStr("", ""))
    }

    //        return haystack.range(of: needle)?.lowerBound.encodedOffset ?? -1;

    func strStr(_ haystack: String, _ needle: String) -> Int {

        if needle.count == 0 {
            return 0;
        }

        if let range = haystack.range(of: needle) {
            return range.lowerBound.encodedOffset;
        } else {
            return -1;
        }
    }
}
