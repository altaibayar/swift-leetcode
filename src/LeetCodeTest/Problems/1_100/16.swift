//
//  16.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 16/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_16: ProblemProtocol {
    func run() {
        print(threeSumClosest([0, 0, 0], 1));
        print(threeSumClosest([-1, 2, 1, -4], 1));
        print(threeSumClosest([0, 1, 2, -1, -2], 1));
        print(threeSumClosest([-1, 0, 1, 2, -1, -4], 2));
    }

    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        if nums.count < 3 { return -1; }
        var result = nums[0] + nums[1] + nums[2];

        let sorted = nums.sorted();

        for i in 0 ..< sorted.count - 2 {
            var j1 = i + 1;
            var j2 = sorted.count - 1;

            while j1 < j2 {
                let sum = sorted[i] + sorted[j1] + sorted[j2];

                if sum == target {
                    return target;
                } else if sum < target {
                    j1 += 1;
                } else {
                    j2 -= 1;
                }

                if abs(sum - target) < abs(result - target) { result = sum; }
            }
        }

        return result;
    }
}
