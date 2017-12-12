//
//  7.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 09/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_7: ProblemProtocol {
    func run() {

        print(reverse(1534236469));
    }

    func reverse(_ x: Int) -> Int {

        var result = 0;
        var tmp = abs(x);

        while tmp > 0 {
            let m = tmp % 10;
            result *= 10;
            result += m;

            tmp = tmp / 10;
        }

        if x < 0 { result *= -1; }
        if result > Int32.max || result < Int32.min {
            return 0;
        } else {
            return result;
        }
    }
}
