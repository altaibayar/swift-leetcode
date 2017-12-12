//
//  167.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 09/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_167: ProblemProtocol {
    func run() {
        print(twoSum([2, 7, 11, 15], 22))
    }

    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var i1 = 0, i2 = numbers.count - 1;

        while numbers[i1] + numbers[i2] != target {
            if numbers[i1] + numbers[i2] > target {
                i2 -= 1;
            } else {
                i1 += 1;
            }
        }

        return [i1 + 1, i2 + 1];
    }
}
