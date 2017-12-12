//
//  1.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 09/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_1: ProblemProtocol {

    func run() {

        print(twoSum([2, 7, 9, 15], 9));
    }

    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var complements = [Int: Int]();
        for (i, n) in nums.enumerated() {
            let complement = target - n;
            if let j = complements[complement] {
                return [j, i];
            } else {
                complements[n] = i;
            }
        }

        return [0, 0];   
    }

}
