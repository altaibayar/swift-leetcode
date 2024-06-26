//
//  215.swift
//  LeetCodeTest
//
//  Created by a on 26/06/2024.
//  Copyright © 2024 tsevealt. All rights reserved.
//

import Foundation

class Problem_215: ProblemProtocol {
    
    class MaxHeap {
        var array = [Int]()

        func insert(_ n: Int) {
            array.append(n)
            var idx = array.count - 1
            
            while idx > 0 {
                let parentIdx = (idx - 1) / 2
                if parentIdx >= idx { break }
                
                if (array[idx] > array[parentIdx]) {
                    array.swapAt(idx, parentIdx)
                }
                
                idx = parentIdx
            }
        }
        
        func removeMin() -> Int {
            var result = array.first!
            
            var idx = 0
            array.swapAt(0, array.count - 1)
            array.removeLast()

            while idx < array.count {
                let left = (idx * 2) + 1
                let right = (idx * 2) + 2
                
                var swapIndex = idx

                if left < array.count, array[left] > array[swapIndex] {
                    swapIndex = left
                }
                if right < array.count, array[right] > array[swapIndex] {
                    swapIndex = right
                }
                
                if idx == swapIndex { break }
                
                array.swapAt(swapIndex, idx)
                idx = swapIndex
            }
            
            return result
        }
    }
    
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        let heap = MaxHeap()
        for n in nums { heap.insert(n) }
        
        var result = 0
        for _ in 0 ..< k {
            result = heap.removeMin()
        }
                
        return result
    }
    
    func run() {
        print(findKthLargest([3,2,1,5,6,4], 2))
        print(findKthLargest([3,2,3,1,2,4,5,5,6], 4))
    }
}
