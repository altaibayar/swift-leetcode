//
//  15.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 16/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_15: ProblemProtocol {
    func run() {
        print(threeSum([0, 0, 0]));
        print(threeSum([0, 1, 2, -1, -2]));
        print(threeSum([-1, 0, 1, 2, -1, -4]));
    }

    func threeSum(_ nums: [Int]) -> [[Int]] {
        if nums.count < 3 {
            return [];
        }

        var result: [[Int]] = [];

        let sorted = nums.sorted();
        var i = 0;
        while i < sorted.count - 2 {
            var j1 = i + 1;
            var j2 = sorted.count - 1;
            let sum = -sorted[i];

            while j1 < j2 {

                if sorted[j1] + sorted[j2] == sum {
                    result.append([sorted[i], sorted[j1], sorted[j2]]);

                    while j1 < j2 && sorted[j1] == sorted[j1 + 1] { j1 += 1; }
                    while j1 < j2 && sorted[j2] == sorted[j2 - 1] { j2 -= 1; }

                    j1 += 1;
                    j2 -= 1;
                } else if sorted[j1] + sorted[j2] < sum {
                    j1 += 1;
                } else {
                    j2 -= 1;
                }
            }

            while i < sorted.count - 2 && sorted[i] == sorted[i + 1] { i += 1; }
            i += 1;
        }

        return result;
    }
}
