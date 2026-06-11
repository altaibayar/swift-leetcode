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
        var canOpen = status.map { $0 == 1 }
        var hasBox = [Bool](repeating: false, count: status.count)
        var used = [Bool](repeating: false, count: status.count)

        var result = 0

        var queue = [Int]()
        for box in initialBoxes {
            hasBox[box] = true
            if canOpen[box] {
                queue.append(box)
                used[box] = true
                result += candies[box]
            }
        }

        while !queue.isEmpty {
            let box = queue.removeFirst()

            for key in keys[box] {
                canOpen[key] = true

                if !used[key] && hasBox[key] {
                    queue.append(key)
                    used[key] = true
                    result += candies[key]
                }
            }
            
            for contained in containedBoxes[box] {
                hasBox[contained] = true
                
                if !used[contained] && canOpen[contained] {
                    queue.append(contained)
                    used[contained] = true
                    
                    result += candies[contained]
                }
            }
            
        }

        return result
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
