//
//  53.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 09/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_53: ProblemProtocol {
    func run() {
        print(maxSubArray([-2,1,-3,4,-1,2,1,-5,4]));
    }

    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.count == 0 { return 0; }

        let maxFunc: (Int, Int) -> (Int) = { i1, i2 in
            return i1 < i2 ? i2 : i1;
        }

        var max = nums[0];
        var current = nums[0];

        for i in 1 ..< nums.count {
            current = maxFunc(nums[i], current + nums[i])
            max = maxFunc(max, current);
        }

        return max;
    }
}
