//
//  69.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 09/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_69: ProblemProtocol {
    func run() {
        print(mySqrt(4));
        print(mySqrt(8));
    }

    func mySqrt(_ x: Int) -> Int {
        return Int(floor(sqrt(Double(x))));
    }
}
