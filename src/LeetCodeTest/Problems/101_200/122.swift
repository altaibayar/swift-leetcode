//
//  122.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 10/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_122: ProblemProtocol {
    func run() {
        print(maxProfit([7, 1, 5, 3, 6, 4]));
    }

    func maxProfit(_ prices: [Int]) -> Int {
        if prices.count == 0 {
            return 0;
        }

        var result = 0;
        for i in 1 ..< prices.count {
            let p1 = prices[i - 1];
            let p2 = prices[i];

            result += max(0, p2 - p1);
        }

        return result;
    }
}
