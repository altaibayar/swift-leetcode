//
//  88.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 09/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_88: ProblemProtocol {
    func run() {
        var a: [Int] = [1,2,3,0,0,0]
        let b: [Int] = [2,5,6,0,0,0];
        merge(&a, 3, b, 3);

        print(a);
    }

    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var limit = m;
        for i2 in 0 ..< n {

            var i1 = 0;
            while i1 < limit && nums1[i1] < nums2[i2] {
                i1 += 1;
            }

            nums1.insert(nums2[i2], at: i1);
            limit += 1;
        }

        while nums1.count > m + n {
            let _ = nums1.popLast();
        }
    }
}
