//
//  Kadane.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 2019-01-26.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Kadane {

    func largestSubArray(in array: [Int]) -> (minIndex: Int, maxIndex: Int, sum: Int)? {
        if array.count == 0 {
            return nil
        } else if array.count == 1 {
            return (0, 0, array[0])
        }

        var max_so_far = array[0], start = 0, end = 0, s = 0
        var max_ending_here = 0

        for (i, a) in array.enumerated() {
            max_ending_here = max_ending_here + a
            if max_so_far < max_ending_here {
                max_so_far = max_ending_here
                start = s
                end = i
            }
            
            if max_ending_here < 0 {
                max_ending_here = 0
                s = i + 1
            }
        }
        
        return (start, end, max_so_far)
    }
    
}
