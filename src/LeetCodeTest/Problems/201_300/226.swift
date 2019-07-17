//
//  226.swift
//  LeetCodeTest
//
//  Created by Altai Tseveenbayar on 2019-07-17.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_226: ProblemProtocol {
    
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
    
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
    
        let left = root.left
        let right = root.right
        
        root.left = right
        root.right = left
        
        invertTree(left)
        invertTree(right)
        
        return root
    }
    
    func run() {
        let tree = TreeNode.create([4, 2, 7, 1, 3, 6, 9])
        let inverted = invertTree(tree)
    }
}
