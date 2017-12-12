//
//  70.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 09/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_70: ProblemProtocol {
    func run() {
        print(climbStairs(2));
        print(climbStairs(3));
    }

    func climbStairs(_ n: Int) -> Int {
        if n <= 2 { return n; }

        var cache = [Int](repeating: 0, count: n);
        cache[0] = 1;
        cache[1] = 2;

        for i in 2 ..< n {
            cache[i] = cache[i - 1] + cache[i - 2];
        }

        return cache.last!;
    }
}
