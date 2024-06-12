//
//  872.swift
//  LeetCodeTest
//
//  Created by a on 12/06/2024.
//  Copyright © 2024 tsevealt. All rights reserved.
//

import Foundation

class Problem_872: ProblemProtocol {
    
    class TreeNodeIterator: IteratorProtocol {
        
        typealias Element = Int
        
        let root: TreeNode
        var stack = [TreeNode]()
        
        init(root: TreeNode) {
            self.root = root
            stack.append(root)
        }
        
        func next() -> Int? {
            while !stack.isEmpty {
                let top = stack.removeLast()
                
                if let left = top.left {
                    stack.append(left)
                }

                if let right = top.right {
                    stack.append(right)
                }
                                
                if top.left == nil && top.right == nil {
                    return top.val
                }
            }
            
            return nil
        }
    }
    
    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        guard let root1 = root1, let root2 = root2 else { return false }
        
        let it1 = TreeNodeIterator(root: root1)
        let it2 = TreeNodeIterator(root: root2)
        
        while true {
            let v1 = it1.next()
            let v2 = it2.next()
            
            if v1 == nil && v2 == nil { return true }
            if v1 != v2 { return false }
        }
    }
    
    func run() {
        let root1 = TreeNode.create([3,5,1,6,2,9,8,nil,nil,7,4])
        let root2 = TreeNode.create([3,5,1,6,7,4,2,nil,nil,nil,nil,nil,nil,9,8])
        
        print(leafSimilar(root1, root2))
    }
}

