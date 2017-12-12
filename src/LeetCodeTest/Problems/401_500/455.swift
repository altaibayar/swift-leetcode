//
//  455.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 10/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_455: ProblemProtocol {
    func run() {
        print(findContentChildren([1, 2, 3], [1, 1]))
    }

    func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
        let greeds = g.sorted();
        let sizes = s.sorted();

        var i = 0;
        var result = 0;
        for s in sizes {
            if i == greeds.count {
                break;
            }

            if s >= greeds[i] {
                result += 1;
                i += 1;
            }
        }

        return result;
    }
}
