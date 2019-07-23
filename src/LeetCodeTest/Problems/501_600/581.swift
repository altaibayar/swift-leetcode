//
//  581.swift
//  LeetCodeTest
//
//  Created by Altai Tseveenbayar on 2019-07-23.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_581: ProblemProtocol {
    
    func findUnsortedSubarray(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return 0}

        var leftIndex = 0
        var rightIndex = nums.count - 2
        
        // left
        while leftIndex < nums.count - 1 && nums[leftIndex] <= nums[leftIndex + 1] {
            leftIndex += 1
        }
        if leftIndex == nums.count - 1 { return 0 }
    
        // right
        while rightIndex > 0 && nums[rightIndex] <= nums[rightIndex + 1] {
            rightIndex -= 1
        }
        if rightIndex == 0 { return nums.count }

        // left target
        let leftTarget = min(nums.firstIndex { n -> Bool in
            n > nums[leftIndex]
        } ?? leftIndex, leftIndex)
        
        // right target
        let rightTarget = max(nums.lastIndex { n -> Bool in
            n < nums[rightIndex]
        } ?? rightIndex, rightIndex)

        return rightTarget - leftTarget + 1
    }

    func run() {
//        print(findUnsortedSubarray([2, 6, 4, 8, 10, 9, 15]))    //5
//        print(findUnsortedSubarray([1, 2, 3, 4, 5, 6, 7]))      //0
//        print(findUnsortedSubarray([]))
//        print(findUnsortedSubarray([1]))
//        print(findUnsortedSubarray([1, 2]))                     //0
//        print(findUnsortedSubarray([5,4,3,2,1]))                //5
//        print(findUnsortedSubarray([2, 1]))                     //2
//        print(findUnsortedSubarray([1,3,2,2,2]))                //4
    
        print(findUnsortedSubarray([2,3,3,2,4]))                //3
    }
}
