//
//  342.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 10/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_342: ProblemProtocol {
    func run() {

        print(isPowerOfFour(123));
        print(isPowerOfFour(1));
    }

    func isPowerOfFour(_ num: Int) -> Bool {
        if num < 0 { return false; }

        //if power of two
        if num & (num - 1) != 0 {
            return false;
        }

        //power of 4 e.g == P: (P - 1) is always divisible by 3
        return (num - 1) % 3 == 0;
    }
}
