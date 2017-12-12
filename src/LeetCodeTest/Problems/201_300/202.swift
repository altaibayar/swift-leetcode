//
//  202.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 09/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_202: ProblemProtocol {
    func run() {
        print(isHappy(19));
    }

    func isHappy(_ n: Int) -> Bool {
        var current = n;
        var set = Set<Int>();

        while current != 1 && false == set.contains(current) {
            set.insert(current);

            var tmp = 0;

            while current > 0 {
                let m = current % 10;
                tmp += (m * m);

                current /= 10;
            }

            current = tmp;
        }

        return current == 1;
    }
}
