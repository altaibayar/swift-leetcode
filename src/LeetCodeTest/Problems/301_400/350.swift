//
//  350.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 09/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_350: ProblemProtocol {
    func run() {
        print(intersect([1, 2, 2, 1], [2, 2]));
    }

    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var d1 = [Int: Int]();

        for n1 in nums1 {
            if let d = d1[n1] {
                d1[n1] = d + 1;
            } else {
                d1[n1] = 1;
            }
        }

        var result = [Int]();

        for n2 in nums2 {
            if let d = d1[n2] {
                result.append(n2);
                if d == 1{
                    d1.removeValue(forKey: n2);
                } else {
                    d1[n2] = d - 1;
                }
            }
        }

        return result;
    }
}
