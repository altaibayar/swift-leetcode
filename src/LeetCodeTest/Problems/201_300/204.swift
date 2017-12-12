//
//  204.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 09/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_204: ProblemProtocol {
    func run() {
        print(countPrimes(0));
        print(countPrimes(1));
        print(countPrimes(2));
        print(countPrimes(10));
    }

    func countPrimes(_ n: Int) -> Int {
        if n <= 1 { return 0; }

        var result = 0;

        var primes = [Bool](repeating: true, count: n);
        for i in 2 ..< n {
            if primes[i] {
                result += 1;

                var j = 2;
                while i * j < n {
                    primes[i * j] = false;
                    j += 1;
                }

            }
        }

        return result;
    }
}
