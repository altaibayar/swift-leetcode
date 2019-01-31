
//
//  Problem_189.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 2019-01-27.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_189: ProblemProtocol {
    func run() {
        var A = [1,2,3,4,5,6,7]
        rotate(&A, 3)
        print(A)

        var B = [1,2,3,4, 5]
        rotate(&B, 2)
        print(B)

        var C = [1,2,3,4]
        rotate(&C, 0)
        print(C)

        var D = [1,2,3,4]
        rotate(&D, 4)
        print(D)

        var E = [1,2,3,4]
        rotate(&E, 1)
        print(E)
    }

    func rotate(_ nums: inout [Int], _ k: Int) {
        guard false == nums.isEmpty else { return }

        let k = k % nums.count
        guard k > 0 else { return }

        let N = nums.count

        rotate(&nums, 0, N - 1)
        rotate(&nums, 0, k - 1)
        rotate(&nums, k, N - 1)
    }

    func rotate(_ nums: inout [Int], _ l: Int, _ u: Int) {
        for i in 0 ... (u - l) / 2 {
            nums.swapAt(l + i, u - i)
        }
    }
}
