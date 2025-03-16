//
//  347.swift
//  LeetCodeTest
//
//  Created by a on 16/03/2025.
//  Copyright © 2025 tsevealt. All rights reserved.
//

fileprivate typealias Element = (Int, Int)

class Problem_347: ProblemProtocol {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var freq = [Int: Int]()

        for n in nums {
            freq[n, default: 0] += 1
        }

        var heap = MaxHeap()
        for (k, v) in freq {
            heap.insert(el: (k, v))
        }

        var result = [Int]()
        while heap.count > 0 && result.count < k {
            let remove = heap.remove()
            result.append(remove.0)
        }

        return result
    }

    func run() {
//        print(topKFrequent([1, 1, 1, 2, 2, 3], 2))  // [1, 2]
//        print(topKFrequent([1], 1))  // [1]
//        print(topKFrequent([3, 0, 1, 0], 1))  // 1
//        print(topKFrequent([1,1,1,2,2,3], 2)) // [1, 2]
//        print(topKFrequent([-1, -1], 1)) // [-1]
//        print(topKFrequent([4,1,-1,2,-1,2,3], 2))
//        print(topKFrequent([3,0,1,0], 1)) // [0]
        
//        let n = [4, 6, 7, 8, 9, 10, 3, 2, 1, 0]
//        var heap = MaxHeap()
//        n.forEach { heap.insert(el: (1, $0)) }
//        
//        while heap.count > 0 {
//            print(heap.remove().1)
//        }
    }
}

private struct MaxHeap {
    var elements: [Element] = []

    let firstLarger: (Element, Element) -> Bool = {
        $0.1 > $1.1
    }

    var count: Int { elements.count }

    mutating func insert(el: Element) {
        elements.append(el)
        bubbleUp(from: elements.count - 1)
    }

    mutating func remove() -> Element {
        elements.swapAt(0, elements.count - 1)
        let result = elements.popLast()!
        bubbleDown(from: 0)

        return result
    }

    private mutating func bubbleUp(from index: Int) {
        var child = index
        var parent = (index - 1) / 2
        
        while child > 0 && firstLarger(elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            
            child = parent
            parent = (parent - 1) / 2
        }
    }

    private mutating func bubbleDown(from index: Int) {
        var current = index
        while true {
            let leftChildIndex = (2 * current) + 1
            let rightChildIndex = (2 * current) + 2

            var candidate = current
            if leftChildIndex < count && firstLarger(elements[leftChildIndex], elements[candidate])
            {
                candidate = leftChildIndex
            }

            if rightChildIndex < count
                && firstLarger(elements[rightChildIndex], elements[candidate])
            {
                candidate = rightChildIndex
            }
            
            if candidate == current {
                return
            }
            
            elements.swapAt(candidate, current)
            current = candidate
        }
    }
}
