//
//  129.swift
//  LeetCodeTest
//
//  Created by a on 20/03/2025.
//  Copyright © 2025 tsevealt. All rights reserved.
//

class Problem_129: ProblemProtocol {
    func sumNumbers(_ root: TreeNode?) -> Int {
        typealias StackElement = (node: TreeNode, acc: Int)
        
        guard let root = root else { return 0 }
        if root.left == nil && root.right == nil { return root.val }
        
        var result = 0
        
        var stack: [StackElement] = [(node: root, acc: root.val)]
        while let (node, acc) = stack.popLast() {
            if node.left == nil && node.right == nil {
                result += acc
            } else {
                
                if let left = node.left {
                    stack.append((node: left, acc: (acc * 10) + left.val))
                }
                
                if let right = node.right {
                    stack.append((node: right, acc: (acc * 10) + right.val))
                }
            }
        }

        return result
    }
    
    func run() {
    }
}
