//
//  496.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 10/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_496: ProblemProtocol {

    func run() {
        print(nextGreaterElement([4, 1, 2], [1, 3, 4, 2]));
    }

    func nextGreaterElement(_ findNums: [Int], _ nums: [Int]) -> [Int] {
        var stack: [Int] = [];
        var map: [Int: Int] = [:];

        for n in nums {
            while false == stack.isEmpty && stack.last! < n {
                let last = stack.popLast()!;
                map[last] = n;
            }

            stack.append(n);
        }

        var result = [Int]();
        for n in findNums {
            if let m = map[n] {
                result.append(m);
            } else {
                result.append(-1);
            }
        }

        return result;
    }
}

