//
//  1298.swift
//  LeetCodeTest
//
//  Created by a on 11/06/2026.
//  Copyright © 2026 tsevealt. All rights reserved.
//

class Problem_1298: ProblemProtocol {
    func maxCandies(
        _ status: [Int],
        _ candies: [Int],
        _ keys: [[Int]],
        _ containedBoxes: [[Int]],
        _ initialBoxes: [Int]
    ) -> Int {
        0
    }

    func run() {
        print(
            maxCandies(
                [1, 0, 1, 0],
                [7, 5, 4, 100],
                [[], [], [1], []],
                [[1, 2], [3], [], []],
                [0]
            )
        )

        print(
            maxCandies(
                [1, 0, 0, 0, 0, 0],
                [1, 1, 1, 1, 1, 1],
                [[1, 2, 3, 4, 5], [], [], [], [], []],
                [[1, 2, 3, 4, 5], [], [], [], [], []],
                [0]
            )
        )
    }
}
