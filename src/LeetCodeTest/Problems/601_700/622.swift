//
//  622.swift
//  LeetCodeTest
//
//  Created by a on 16/03/2025.
//  Copyright © 2025 tsevealt. All rights reserved.
//

class Problem_622: ProblemProtocol {
    class MyCircularQueue {
        var elements: [Int]
        var head = 0
        var count = 0
        let k: Int
        
        init(_ k: Int) {
            self.k = k
            elements = Array(repeating: 0, count: k)
        }

        func enQueue(_ value: Int) -> Bool {
            guard count < k else { return false }
            
            elements[(head + count) % k] = value
            count += 1
            
            return true
        }

        func deQueue() -> Bool {
            guard count > 0 else { return false }

            head = (head + 1) % k
            count -= 1
            return true
        }

        func Front() -> Int {
            count == 0 ? -1 : elements[head]
        }

        func Rear() -> Int {
            count == 0 ? -1 : elements[(head + count - 1) % k]
        }

        func isEmpty() -> Bool {
            count == 0
        }

        func isFull() -> Bool {
            count == k
        }
    }

    func run() {
        let myCircularQueue = MyCircularQueue(3);
        print(myCircularQueue.enQueue(1))
        print(myCircularQueue.enQueue(2))
        print(myCircularQueue.enQueue(3))
        print(myCircularQueue.enQueue(4))
        print(myCircularQueue.Rear())
        print(myCircularQueue.isFull())
        print(myCircularQueue.deQueue())
        print(myCircularQueue.enQueue(4))
        print(myCircularQueue.Rear())
    }
}
