//
//  StackUsingLinkedList.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 2019-01-26.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class StackUsingLinkedList<T>{
    
    class Node {
        var value: T
        fileprivate var next: Node?
        
        init(value: T) {
            self.value = value
        }
    }
    
    private var lastNode: Node?
    
    func push(node: Node) {
        node.next = lastNode
        lastNode = node
    }
    
    func pop() -> Node? {
        let tmp = lastNode
        lastNode = lastNode?.next
        
        return tmp
    }
}
