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
    
    private var rootNode: Node?
    
    func push(node: Node) {
        node.next = rootNode
        rootNode = node
    }
    
    func pop() -> Node? {
        let tmp = rootNode
        rootNode = rootNode?.next
        
        return tmp
    }
}
