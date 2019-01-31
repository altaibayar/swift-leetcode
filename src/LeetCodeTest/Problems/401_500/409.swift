//
//  409.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 2019-01-27.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_409: ProblemProtocol {
    func run() {
        print(longestPalindrome("abccccdd"))
    }

    func longestPalindrome(_ s: String) -> Int {
        var counts: [Character: Int] = [:]

        for ch in s {
            if let count = counts[ch] {
                counts[ch] = count + 1
            } else {
                counts[ch] = 1
            }
        }

        var addOne = false
        var result = 0
        for (_, val) in counts {
            result += val - (val % 2)
            if val % 2 == 1 { addOne = true }
        }

        return addOne ? result + 1 : result
    }
}
