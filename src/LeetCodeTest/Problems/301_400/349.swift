//
//  349.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 09/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_349: ProblemProtocol {
    func run() {
        print(intersection([1, 2, 2, 1], [2, 2]));
    }

    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let set1 = Set<Int>(nums1);

        var resultSet = Set<Int>();
        for n2 in nums2 {
            if set1.contains(n2) {
                resultSet.insert(n2);
            }
        }

        return [Int].init(resultSet);
    }
}
