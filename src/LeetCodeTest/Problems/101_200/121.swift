//
//  121.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 09/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_121: ProblemProtocol {
    func run() {
        print(maxProfit([7, 1, 5, 3, 6, 4]));
        print(maxProfit([7, 6, 4, 3, 1]));
    }

    let maxFunc: (Int, Int) -> (Int) = { i1, i2 in
        return i1 < i2 ? i2 : i1;
    }

    func maxProfit(_ prices: [Int]) -> Int {
        if prices.count == 0 { return 0; }

        var max = 0, current = 0;
        for i in 1 ..< prices.count {
            let p1 = prices[i];
            let p2 = prices[i - 1];

            current = maxFunc(0, current + p1 - p2);
            max = maxFunc(max, current);
        }

        return max;
    }
}
