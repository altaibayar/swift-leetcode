//
//  2101.swift
//  LeetCodeTest
//
//  Created by a on 02/07/2026.
//  Copyright © 2026 tsevealt. All rights reserved.
//

import Foundation

class Problem_2101: ProblemProtocol {

    func maximumDetonation(_ bombs: [[Int]]) -> Int {
        guard !bombs.isEmpty else { return 0 }

        func distance(_ x1: Int, _ y1: Int, _ x2: Int, _ y2: Int) -> Double {
            let dX = Double(x1 - x2)
            let dY = Double(y1 - y2)

            return sqrt((dX * dX) + (dY * dY))
        }

        var result = 0

        for i in 0..<bombs.count {
            var exploded = 0

            var used = [Bool](repeating: false, count: bombs.count)

            var toVisit = Set<Int>()
            toVisit.insert(i)

            while let currentBombIndex = toVisit.popFirst() {
                used[currentBombIndex] = true
                exploded += 1

                for (i, b) in bombs.enumerated() {
                    if used[i] { continue }

                    let d = distance(
                        bombs[currentBombIndex][0],
                        bombs[currentBombIndex][1],
                        b[0],
                        b[1]
                    )

                    if d <= Double(bombs[currentBombIndex][2]) {
                        toVisit.insert(i)
                    }
                }
            }

            result = max(result, exploded)
        }

        return result
    }

    func run() {
        print(maximumDetonation([[2, 1, 3], [6, 1, 4]]))
        print(maximumDetonation([[1, 1, 5], [10, 10, 5]]))
        print(maximumDetonation([[1, 2, 3], [2, 3, 1], [3, 4, 2], [4, 5, 3], [5, 6, 4]]))
    }
}
