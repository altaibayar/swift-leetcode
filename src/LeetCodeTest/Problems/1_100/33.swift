//
//  33.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 2019-09-08.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_33: ProblemProtocol {

    func search(_ nums: [Int], _ target: Int) -> Int {
        var start = 0, end = nums.count - 1

        while start <= end {
            let mid = start + ((end - start) / 2)

            print("start: \(start) end: \(end) mid: \(mid)")

            if nums[mid] == target {
                return mid

            } else if nums[mid] >= nums[start] {
                if target >= nums[start] && target < nums[mid] { end = mid - 1 }
                else { start = mid + 1 }

            } else {
                if target <= nums[end] && target > nums[mid] { start = mid + 1 }
                else { end = mid - 1 }
            }
        }

        return -1
    }

    func run() {
        print(search([4,5,6,7,0,1,2], 0))
//        print(search([4,5,6,7,0,1,2], 3))
    }
}
