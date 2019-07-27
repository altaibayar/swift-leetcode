//
//  253.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 2019-07-27.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_253: ProblemProtocol {

    func minMeetingRooms(_ intervals: [[Int]]) -> Int {
        guard intervals.count > 1 else {
            return intervals.count
        }

        let starts = intervals.map { $0[0] }.sorted()
        let ends = intervals.map { $0[1] }.sorted()

        var result = 0
        var end = 0

        for i in 0 ..< intervals.count {
            if starts[i] < ends[end] {
                result += 1
            } else {
                end += 1
            }
        }

        return result
    }

    func run() {
        print(minMeetingRooms([ [0, 30], [5, 10], [15, 20] ]))
        print(minMeetingRooms([ [7,10], [2,4] ]))
    }
}
