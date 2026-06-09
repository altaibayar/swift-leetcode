//
//  1235.swift
//  LeetCodeTest
//
//  Created by a on 09/06/2026.
//  Copyright © 2026 tsevealt. All rights reserved.
//

class Problem_1235: ProblemProtocol {
    var memo = [Int](repeating: -1, count: 50001)

    func findNextJob(startTime: [Int], lastEndingIndex: Int) -> Int {
        var left = 0
        var right = startTime.count - 1
        var result = startTime.count

        while left <= right {
            let middle = left + (right - left) / 2

            if startTime[middle] >= lastEndingIndex {
                result = middle
                right = middle - 1
            } else {
                left = middle + 1
            }
        }

        return result
    }

    func findMaxProfit(jobs: [[Int]], startTime: [Int], n: Int, position: Int) -> Int {
        if position == n {
            return 0
        }

        if memo[position] != -1 {
            return memo[position]
        }

        let nextIndex = findNextJob(startTime: startTime, lastEndingIndex: jobs[position][1])
        let maxProfit = max(
            findMaxProfit(jobs: jobs, startTime: startTime, n: n, position: position + 1),
            jobs[position][2]
                + findMaxProfit(jobs: jobs, startTime: startTime, n: n, position: nextIndex)
        )

        memo[position] = maxProfit
        return memo[position]
    }

    func jobScheduling(_ startTime: [Int], _ endTime: [Int], _ profit: [Int]) -> Int {
        var jobs = [[Int]]()
        var sortedStartTime = startTime  // Mutable copy to hold sorted start times

        // Reset memoization array
        memo = [Int](repeating: -1, count: 50001)

        for (i, element) in profit.enumerated() {
            jobs.append([startTime[i], endTime[i], element])
        }

        // Sort jobs by start time
        jobs.sort { $0[0] < $1[0] }

        for (i, job) in jobs.enumerated() {
            sortedStartTime[i] = job[0]
        }

        return findMaxProfit(jobs: jobs, startTime: sortedStartTime, n: profit.count, position: 0)
    }

    func run() {
        // 120
        print(
            jobScheduling(
                [1, 2, 3, 3],
                [3, 4, 5, 6],
                [50, 10, 40, 70]
            )
        )

        // 150
        print(
            jobScheduling(
                [1, 2, 3, 4, 6],
                [3, 5, 10, 6, 9],
                [20, 20, 100, 70, 60]
            )
        )

        // 6
        print(
            jobScheduling(
                [1, 1, 1],
                [2, 3, 4],
                [5, 6, 4]
            )
        )
    }

}
