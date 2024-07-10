//
//  435.swift
//  LeetCodeTest
//
//  Created by a on 10/07/2024.
//  Copyright © 2024 tsevealt. All rights reserved.
//

import Foundation

class Problem_435: ProblemProtocol {
    func run() {
        print(eraseOverlapIntervals([[1,2],[2,3],[3,4],[1,3]]))
        print(eraseOverlapIntervals([[1,2],[1,2],[1,2]]))
        print(eraseOverlapIntervals([[1,2],[2,3]]))
        print(eraseOverlapIntervals([[1,100],[11,22],[1,11],[2,12]]))
    }
    
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        let sorted = intervals.sorted { $0.end < $1.end }
        
        var lastPoint = Int.min
        var result = 0

        for range in sorted {
            if range.start >= lastPoint {
                lastPoint = range.end
            } else {
                result += 1
            }
        }

        return result
    }
}

extension Array where Element == Int {
    var start: Int { self[0] }
    var end: Int { self[1] }
}
