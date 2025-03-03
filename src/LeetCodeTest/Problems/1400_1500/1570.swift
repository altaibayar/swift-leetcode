//
//  1570.swift
//  LeetCodeTest
//
//  Created by a on 03/03/2025.
//  Copyright © 2025 tsevealt. All rights reserved.
//

fileprivate class SparseVector {
    var indexes = [Int: Int]()
    let size: Int
    
    init(_ nums: [Int]) {
        self.size = nums.count

        for (i, n) in nums.enumerated() {
            if n != 0 {
                indexes[i] = n
            }
        }
    }

    // Return the dotProduct of two sparse vectors
    func dotProduct(_ vec: SparseVector) -> Int {
        guard size == vec.size else { return 0 }
        
        var result = 0
        for (i, n1) in indexes {
            let n2 = vec.indexes[i] ?? 0            
            result += (n1 * n2)
        }
        
        return result
    }
}

class Problem_1570: ProblemProtocol {
    func run() {
        print(SparseVector([1,0,0,2,3]).dotProduct(SparseVector([0,3,0,4,0]))) // 8
        print(SparseVector([0,1,0,0,0]).dotProduct(SparseVector([0,0,0,0,2]))) // 0
        print(SparseVector([0,1,0,0,2,0,0]).dotProduct(SparseVector([1,0,0,0,3,0,4]))) // 6
    }
}
