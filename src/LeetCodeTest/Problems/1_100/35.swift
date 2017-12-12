//
//  35.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 09/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_35: ProblemProtocol {

    func run() {
        print(searchInsert([1,3,5,6], 5)) //2
        print(searchInsert([1,3,5,6], 2)) //1
        print(searchInsert([1,3,5,6], 7)) //4
        print(searchInsert([1,3,5,6], 0)) //0
    }

    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        if nums.count == 0 { return 0; }

        for i in 0 ..< nums.count {
            if nums[i] >= target {
                return i;
            }
        }

        return nums.count;
    }
}
