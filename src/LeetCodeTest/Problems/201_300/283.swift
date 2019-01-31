//
//  283.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 2019-01-27.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_283: ProblemProtocol {
    func run() {
        var A = [0,1,0,3,12]
        moveZeroes(&A)
        print(A)

        var B = [0,0,0,0,1]
        moveZeroes(&B)
        print(B)

        var C = [Int]()
        moveZeroes(&C)
        print(C)

        var D = [0]
        moveZeroes(&D)
        print(D)

        var E = [0, 0]
        moveZeroes(&E)
        print(E)

        var F = Array<Int>(1...3)
        moveZeroes(&F)
        print(F)
    }

    func moveZeroes(_ nums: inout [Int]) {
        guard false == nums.isEmpty else { return }

        var numberOfZeros = 0

        for i in 0 ..< nums.count {
            if nums[i] == 0 {
                numberOfZeros += 1
            } else {
                nums[i - numberOfZeros] = nums[i]
            }
        }

        for i in 0 ..< numberOfZeros {
            nums[nums.count - 1 - i] = 0
        }
    }
}
