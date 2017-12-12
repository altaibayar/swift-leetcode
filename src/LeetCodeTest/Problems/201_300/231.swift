//
//  231.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 10/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_231: ProblemProtocol {
    func run() {
        print(isPowerOfTwo(4));
        print(isPowerOfTwo(34));
        print(isPowerOfTwo(121));
        print(isPowerOfTwo(0));
    }

    func isPowerOfTwo(_ n: Int) -> Bool {
        if n <= 0 { return false; }
        return (n & (n - 1)) == 0;
    }
}
