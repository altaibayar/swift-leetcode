//
//  27.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 09/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_27: ProblemProtocol {
    func run() {
        var ar: [Int] = [];
        let val = 3;

        print(removeElement(&ar, val));
    }

    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var i = 0;
        while i < nums.count {
            if nums[i] == val {
                nums.remove(at: i);
            } else {
                i += 1;
            }
        }

        return nums.count;
    }
}
