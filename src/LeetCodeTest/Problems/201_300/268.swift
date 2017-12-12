//
//  268.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 10/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_268: ProblemProtocol {
    func run() {
        print(missingNumber([9,6,4,2,3,5,7,0,1])); //8
        print(missingNumber([3, 0, 1])); //2
        print(missingNumber([0, 1])); //2
    }

    func missingNumber(_ nums: [Int]) -> Int {
        var result = 0;

        for (i, n) in nums.enumerated() {
            result = result ^ i ^ n;
        }

        return result ^ nums.count;
    }
}
