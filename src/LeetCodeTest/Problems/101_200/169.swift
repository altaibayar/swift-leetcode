//
//  169.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 09/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_169: ProblemProtocol {
    func run() {
        print(majorityElement([1, 2, 3, 4, 1, 1, 1]));
    }

    func majorityElement(_ nums: [Int]) -> Int {
        var major = nums[0];
        var count = 0;
        for n in nums {
            if count == 0 {
                major = n;
                count = 1;
            } else if n == major {
                count += 1;
            } else {
                count -= 1;
            }

        }

        return major;
    }
}
