//
//  66.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 09/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_66: ProblemProtocol {

    func run() {
        print(plusOne([1, 9]));
        print(plusOne([ ]));
        print(plusOne([9,9,9,9,9,9 ]));
    }

    func plusOne(_ digits: [Int]) -> [Int] {
        if digits.count == 0 { return [1]; }

        var toAdd = 1;
        var result = [Int]();

        for i in stride(from: digits.count - 1, through: 0, by: -1) {
            let val = digits[i] + toAdd;
            toAdd = val / 10;

            result.insert(val % 10, at: 0);
        }
        if toAdd > 0 {
            result.insert(toAdd, at: 0);
        }

        return result;
    }
}
