//
//  341.swift
//  LeetCodeTest
//
//  Created by a on 16/03/2025.
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

class Problem_341: ProblemProtocol {

    fileprivate class NestedIterator {
        let list: [NestedInteger]

        var indexStack = [Int]()
        var listStack = [[NestedInteger]]()
        
        init(_ nestedList: [NestedInteger]) {
            self.list = nestedList
            
            indexStack = [0]
            listStack = [nestedList]
        }

        func next() -> Int {
            if !hasNext() { fatalError("") }
            
            let currentPos = indexStack.popLast()!
            indexStack.append(currentPos + 1)
            
            return listStack.last![currentPos].getInteger()
        }

        func hasNext() -> Bool {
            makeIntegerFirst()
            
            return !indexStack.isEmpty
        }
        
        func makeIntegerFirst() {
            while let lastIndex = indexStack.last {
                
                if lastIndex >= listStack.last!.count {
                    indexStack.removeLast()
                    listStack.removeLast()
                    continue
                }
                
                if listStack.last![lastIndex].isInteger() {
                    break
                }
                
                listStack.append(listStack.last![lastIndex].getList())
                indexStack.append(indexStack.popLast()! + 1)
                indexStack.append(0)
            }
        }
    }

    func run() {
        var result1 = [Int]()
        let iter1 = NestedIterator([[1,1],2,[1,1]])
        while iter1.hasNext() {
            result1.append(iter1.next())
        }
        print(result1)
    }
}

extension Int: NestedInteger {
    func isInteger() -> Bool { true }

    func getInteger() -> Int { self }

    func setInteger(value: Int) { fatalError() }

    fileprivate func add(elem: any NestedInteger) { fatalError() }

    fileprivate func getList() -> [any NestedInteger] { fatalError() }
}

extension Array: NestedInteger where Element == Int {
    func isInteger() -> Bool { false }

    func getInteger() -> Int { fatalError() }

    func setInteger(value: Int) { fatalError() }

    fileprivate func add(elem: any NestedInteger) { fatalError() }

    fileprivate func getList() -> [any NestedInteger] { self }
}
