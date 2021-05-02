//
//  338.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 2021-05-02.
//  Copyright © 2021 tsevealt. All rights reserved.
//

import Foundation

class Problem_338: ProblemProtocol {
    func countBits(_ num: Int) -> [Int] {
        if num < 1 {
            return [0]
        } else if num < 2 {
            return  [0, 1]
        }

        var result = [Int](repeating: 0, count: num + 1)
        result[0] = 0
        result[1] = 1

        for i in 2 ... num {
            result[i] = result[i / 2] + (i % 2)
        }

        return result
    }


    func countBits_slow(_ num: Int) -> [Int] {
        guard num > 0 else {
            return [0]
        }

        let counter: (Int) -> Int = { val in
            var result = 0
            var current = val

            while current > 0 {
                if current % 2 == 1 {
                    result += 1
                }
                current /= 2
            }

            return result
        }

        var result = [Int](repeating: 0, count: num + 1)

        for i in 0 ... num {
            result[i] = counter(i)
        }

        return result
    }

    func run() {
        print(countBits(2))
        print(countBits(5))
    }
}
