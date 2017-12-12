//
//  136.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 09/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_136: ProblemProtocol {
    func run() {
        print(singleNumber([1, 2, 2, 1, 4, 4, 3]))
    }

    func singleNumber(_ nums: [Int]) -> Int {
        var set = Set<Int>();
        for n in nums {
            if set.contains(n) {
                set.remove(n);
            } else {
                set.insert(n);
            }
        }

        return set.first!;
    }
}
