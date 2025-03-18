//
//  295.swift
//  LeetCodeTest
//
//  Created by a on 18/03/2025.
//  Copyright © 2025 tsevealt. All rights reserved.
//

class Problem_295: ProblemProtocol {
    
    class MedianFinder {
        private var median: Double!
        private var needsUpdate = true
        private var nums = [Int]()

        func addNum(_ num: Int) {
            nums.append(num)
            needsUpdate = true
        }

        func findMedian() -> Double {
            updateIfNeeded()
            return median
        }

        private func updateIfNeeded() {
            guard needsUpdate else { return }
            nums.sort()
            let halfInd = nums.count / 2
            if nums.count % 2 == .zero {
                median = (Double(nums[halfInd]) + Double(nums[halfInd - 1])) / 2
            } else {
                median = Double(nums[halfInd])
            }
            needsUpdate = false
        }
    }
    
    class _MedianFinder {
        
        class Heap {
            let comparator: (Int, Int) -> Bool
                
            var elements: [Int] = []
            var count: Int { elements.count }

            init(comparator: @escaping (Int, Int) -> Bool) {
                self.comparator = comparator
            }

            func insert(num: Int) {
                elements.append(num)
                bubbleUp(index: elements.count - 1)
            }
            
            func pop() -> Int {
                let root = elements[0]
                elements.swapAt(0, elements.count - 1)
                let _ = elements.removeLast()

                bubbleDown(index: 0)

                return root
            }
            
            func peek() -> Int {
                elements[0]
            }
            
            private func bubbleDown(index: Int) {
                var parent = index
                
                while true {
                    let left = leftChildIndex(from: parent)
                    let right = rightChildIndex(from: parent)
                    
                    var candidate = parent
                    if left < elements.count && comparator(elements[candidate], elements[left]) {
                        candidate = left
                    }
                    
                    if right < elements.count && comparator(elements[candidate], elements[right]) {
                        candidate = right
                    }
                    
                    if candidate == parent { break }
                    
                    elements.swapAt(parent, candidate)
                    parent = candidate
                }
            }
            
            private func bubbleUp(index: Int) {
                var parent = parentIndex(from: index)
                var child = index
                
                while child > 0 && comparator(elements[child], elements[parent]) {
                    elements.swapAt(child, parent)
                    
                    child = parent
                    parent = parentIndex(from: child)
                }
            }
            
            private func parentIndex(from index: Int) -> Int {
                (index - 1) / 2
            }
            private func leftChildIndex(from index: Int) -> Int {
                (index * 2) + 1
            }
            private func rightChildIndex(from index: Int) -> Int {
                (index * 2) + 2
            }
        }

        let minHeap: Heap
        let maxHeap: Heap
        
        init() {
            minHeap = Heap(comparator: <)
            maxHeap = Heap(comparator: >)
        }
        
        func addNum(_ num: Int) {
            maxHeap.insert(num: num)
            minHeap.insert(num: maxHeap.peek())
            let _ = maxHeap.pop()

            if maxHeap.count < minHeap.count {
                maxHeap.insert(num: minHeap.peek())
                let _ = minHeap.pop()
            }
        }
        
        func findMedian() -> Double {
            if maxHeap.count > minHeap.count {
                return Double(maxHeap.peek())
            } else {
                return Double(maxHeap.peek() + minHeap.peek()) / 2.0
            }
        }
    }
    
    func run() {
//        let medianFinder = MedianFinder();
//        medianFinder.addNum(1);    // arr = [1]
//        medianFinder.addNum(2);    // arr = [1, 2]
//        print(medianFinder.findMedian()); // return 1.5 (i.e., (1 + 2) / 2)
//        medianFinder.addNum(3);    // arr[1, 2, 3]
//        print(medianFinder.findMedian()); // return 2.0

        let medianFinder = MedianFinder();

        medianFinder.addNum(-1);
//        print(medianFinder.findMedian());

        medianFinder.addNum(-2);
//        print(medianFinder.findMedian());
        
        medianFinder.addNum(-3);
//        print(medianFinder.findMedian());

        medianFinder.addNum(-4);
        print(medianFinder.findMedian());

        medianFinder.addNum(-5);
        print(medianFinder.findMedian());
    }
}
