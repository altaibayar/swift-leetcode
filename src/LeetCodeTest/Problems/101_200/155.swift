//
//  155.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 24/01/2019.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_155: ProblemProtocol {
    func run() {
        let minStack = MinStack();
        minStack.push(-2);
        minStack.push(0);
        minStack.push(-3);
        print(minStack.getMin()) // -3
        minStack.pop();
        print(minStack.top()) //0
        print(minStack.getMin()) // -2
    }

    class MinStack {

        var stack = [(Int, Int)]()

        /** initialize your data structure here. */
        init() {

        }

        func push(_ x: Int) {
            if stack.isEmpty {
                stack.append((x, x))
            } else {
                stack.append((x, min(x, getMin())))
            }
        }

        func pop() {
            let _ = stack.popLast()
        }

        func top() -> Int {
            return stack.last!.0
        }

        func getMin() -> Int {
            return stack.last!.1
        }
    }
}
