//
//  442.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 16/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_442: ProblemProtocol {
    func run() {
        print(findDuplicates([4,3,2,7,8,2,3,1]))
    }

    func findDuplicates(_ nums: [Int]) -> [Int] {
        var result = [Int]();

        var tmp = nums;
        for n in nums {
            let idx = n - 1;
            if tmp[idx] < 0 {
                result.append(n);
            } else {
                tmp[idx] = -tmp[idx];
            }
        }

        return result;
    }
}
