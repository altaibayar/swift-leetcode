//
//  339.swift
//  LeetCodeTest
//
//  Created by a on 20/03/2025.
//  Copyright © 2025 tsevealt. All rights reserved.
//

fileprivate protocol NestedInteger {
    // Return true if this NestedInteger holds a single integer, rather than a nested list.
    func isInteger() -> Bool

    // Return the single integer that this NestedInteger holds, if it holds a single integer
    // The result is undefined if this NestedInteger holds a nested list
    func getInteger() -> Int

    // Set this NestedInteger to hold a single integer.
    func setInteger(value: Int)

    // Set this NestedInteger to hold a nested list and adds a nested integer to it.
    func add(elem: NestedInteger)

    // Return the nested list that this NestedInteger holds, if it holds a nested list
    // The result is undefined if this NestedInteger holds a single integer
    func getList() -> [NestedInteger]
}

class Problem_339: ProblemProtocol {
    fileprivate func depthSum(_ nestedList: [NestedInteger]) -> Int {
        var stack: [(depth: Int, item: NestedInteger)] = []
        for item in nestedList {
            stack.append((depth: 1, item: item))
        }
        
        var result = 0;
        
        while let (depth, item) = stack.popLast() {
            if item.isInteger() {
                result += (item.getInteger() * depth)
            } else {
                let children = item.getList()
                if !children.isEmpty {
                    children.forEach { stack.append((depth: depth + 1, item: $0)) }
                }
            }
        }
        
        return result
    }

    func run() {
    }
}
