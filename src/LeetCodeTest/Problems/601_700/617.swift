//
//  617.swift
//  LeetCodeTest
//
//  Created by Altai Tseveenbayar on 2019-07-26.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_617: ProblemProtocol {

    /**
     * Definition for a binary tree node.
     * public class TreeNode {
     *     public var val: Int
     *     public var left: TreeNode?
     *     public var right: TreeNode?
     *     public init(_ val: Int) {
     *         self.val = val
     *         self.left = nil
     *         self.right = nil
     *     }
     * }
     */
    
    func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
        if t1 == nil && t2 == nil {
            return nil
        }
        
        let result = TreeNode((t1?.val ?? 0) + (t2?.val ?? 0))
        result.left = mergeTrees(t1?.left, t2?.left)
        result.right = mergeTrees(t1?.right, t2?.right)
    
        return result
    }
    
    func run() {
        let left = TreeNode.create([1, 3, 2, 5])
        let right = TreeNode.create([2, 1, 3, nil, 4, nil, 7])
    
        let merged = mergeTrees(left, right)
        print(merged)
    }
}
