//
//  18.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 17/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_18: ProblemProtocol {
    func run() {
        print(fourSum([1, 0, -1, 0, -2, 2], 0));
        print(fourSum([-1,0,-5,-2,-2,-4,0,1,-2], -9));
    }

    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]();
        if nums.count < 4 { return result; }

        let sorted = nums.sorted();
        for i in 0 ..< sorted.count - 3 {
            if i > 0 && sorted[i] == sorted[i - 1] { continue; }

            for j in i + 1 ..< sorted.count - 2 {
                if j > i + 1 && sorted[j] == sorted[j - 1] { continue; }

                var left = j + 1;
                var right = sorted.count - 1;

                while left < right {

                    let sum = sorted[i] + sorted[j] + sorted[left] + sorted[right];
                    if sum == target {
                        result.append([sorted[i], sorted[j], sorted[left], sorted[right]]);

                        repeat { left += 1; }
                            while left < right && sorted[left] == sorted[left - 1];

                        repeat { right -= 1; }
                            while left < right && sorted[right] == sorted[right + 1];

                    } else if sum < target {
                        left += 1;
                    } else {
                        right -= 1;
                    }
                }
            }
        }

        return result;
    }
}
