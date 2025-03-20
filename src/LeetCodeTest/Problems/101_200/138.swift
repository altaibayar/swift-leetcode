//
//  138.swift
//  LeetCodeTest
//
//  Created by a on 20/03/2025.
//  Copyright © 2025 tsevealt. All rights reserved.
//

fileprivate class Node {
    public var val: Int
    public var next: Node?
    public var random: Node?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}

class Problem_138: ProblemProtocol {
    fileprivate func copyRandomList(_ head: Node?) -> Node? {
        var current = head
        while current != nil {
            let newNode = Node(current!.val)
            newNode.next = current?.next
            current?.next = newNode

            current = newNode.next
        }
        
        current = head
        while current != nil {
            current?.next?.random = current?.random?.next
            current = current?.next?.next
        }
        
        let copyHead: Node? = Node(-1)
        var copyTail = copyHead
        current = head
        while current != nil {
            copyTail?.next = current?.next
            copyTail = copyTail?.next
            
            current?.next = current?.next?.next
            current = current?.next
        }

        return copyHead?.next
    }
    
    
    func run() {
        let head = createNodes([[7,nil],[13,0],[11,4],[10,2],[1,0]])
        let newHead = copyRandomList(head)
        
        print(newHead?.val)
    }
    
    private func createNodes(_ nodes: [[Int?]]) -> Node? {
        var result = [Node?](repeating: nil, count: nodes.count)
        
        for i in 0..<nodes.count {
            result[i] = Node(0)
        }
        
        for (i, node) in nodes.enumerated() {
            result[i]?.val = node[0]!
            if i < nodes.count - 1 { result[i]?.next = result[i + 1] }
            if let randomIdx = node[1] {
                result[i]?.random = result[randomIdx]
            }
        }

        return result[0]
    }
}
