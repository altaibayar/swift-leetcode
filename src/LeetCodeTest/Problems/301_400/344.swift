//
//  344.swift
//  LeetCodeTest
//
//  Created by Altai Tseveenbayar on 2019-07-17.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_344: ProblemProtocol {

    func reverseString(_ s: inout [Character]) {
        
        let N = s.count / 2
        for i1 in 0 ..< N {
            let i2 = s.count - 1 - i1
            let tmp = s[i1]
            s[i1] = s[i2]
            s[i2] = tmp
        }
    }
    
    func run() {
        var array: [Character] = ["h", "e", "l", "l", "o"]
        reverseString(&array)
        print(array)

        array = ["a", "b"]
        reverseString(&array)
        print(array)

        array = ["a"]
        reverseString(&array)
        print(array)

        array = []
        reverseString(&array)
        print(array)

        array = ["H", "a", "n", "n", "a", "h"]
        reverseString(&array)
        print(array)
    }
}
