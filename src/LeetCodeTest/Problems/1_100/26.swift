//
//  26.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 09/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_26 : ProblemProtocol {
    func run() {
        var ar: [Int] = []
        print(removeDuplicates(&ar));
    }

    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count == 0 { return 0;}

        var last: Int = nums[0];
        var i = 1;
        while i < nums.count {
            if nums[i] == last {
                nums.remove(at: i);
            } else {
                last = nums[i];
                i += 1;
            }
        }

        return nums.count;
    }
}
