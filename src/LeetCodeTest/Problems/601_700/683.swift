//
//  683.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 2021-05-03.
//  Copyright © 2021 tsevealt. All rights reserved.
//

import Foundation

class Problem_683: ProblemProtocol {

    func kEmptySlots(_ bulbs: [Int], _ k: Int) -> Int {
        var days = [Int](repeating: 0, count: bulbs.count)
        for (i, b) in bulbs.enumerated() {
            days[b - 1] = i + 1
        }

        var left = 0
        var right = k + 1
        var result = Int.max
        var i = 0

        while right < days.count {
            if days[i] < days[left] || days[i] <= days[right] {
                if i == right {
                    result = min(result, max(days[left], days[right]))
                }

                left = i
                right = k + i + 1
            }

            i += 1
        }

        return result == Int.max ? -1 : result

    }

    func run() {
        print(kEmptySlots([1, 3, 2], 1))
        print(kEmptySlots([1, 2, 3], 1))
    }
}
