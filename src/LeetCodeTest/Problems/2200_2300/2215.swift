//
//  2215.swift
//  LeetCodeTest
//
//  Created by a on 12/06/2024.
//  Copyright © 2024 tsevealt. All rights reserved.
//

import Foundation

class Problem_2215: ProblemProtocol {
    
    func findDifference(_ nums1: [Int], _ nums2: [Int]) -> [[Int]] {
        let set1 = Set(nums1)
        let set2 = Set(nums2)
                
        return [
            [Int](set1.subtracting(set2)),
            [Int](set2.subtracting(set1))
        ]
    }
    
    func run() {
        print(findDifference([1, 2, 3], [2, 4, 6]))
        print(findDifference([1, 2, 3, 3], [1, 1, 2, 2]))
    }
}
