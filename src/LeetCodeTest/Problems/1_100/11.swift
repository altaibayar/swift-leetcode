//
//  11.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 13/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_11: ProblemProtocol {
    func run() {
        print(maxArea([]));
        print(maxArea([1]));
        print(maxArea([1, 2]));
        print(maxArea([1, 1]));
        print(maxArea([1, 2, 3]));
        print(maxArea([1, 2, 3, 4, 5, 6]));
    }

    func maxArea(_ height: [Int]) -> Int {
        if height.count < 2 {
            return 0;
        }

        var result = 0;

        var left = 0, right = height.count - 1;
        while left < right {
            let tmp = min(height[left], height[right]) * (right - left);
            if tmp > result {
                result = tmp;
            }

            if height[left] < height[right] {
                left += 1;
            } else {
                right -= 1;
            }
        }

        return result;
    }
}
