//
//  56.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 16/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_56: ProblemProtocol {

    func run() {
        print(merge(Interval.create([])))
        print(merge(Interval.create([[1,2]])))
        print(merge(Interval.create([[1,1],[2,2],[3,3],[4,4]])))
        print(merge(Interval.create([[1,2],[3,4],[5,6],[7,8]])))
        print(merge(Interval.create([[1,2],[2,3],[3,4],[4,5]])))
        print(merge(Interval.create([[1,3],[2,6],[8,10],[15,18]])))
        print(merge(Interval.create([[2,3],[4,5],[6,7],[8,9],[1,10]])))
    }

    func merge(_ intervals: [Interval]) -> [Interval] {
        if intervals.count == 0 { return []; }

        var result = [Interval]();

        let sorted = intervals.sorted { $0.start < $1.start; };
        var lastEnd = -1;
        for interval in sorted {
            if lastEnd >= interval.start {

                if lastEnd < interval.end {
                    result.last!.end = interval.end;
                    lastEnd = interval.end;
                }

            } else {
                result.append(interval);
                lastEnd = interval.end;
            }
        }

        return result;
    }
}
