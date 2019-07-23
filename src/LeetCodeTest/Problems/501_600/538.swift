//
//  538.swift
//  LeetCodeTest
//
//  Created by Altai Tseveenbayar on 2019-07-23.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_538: ProblemProtocol {
    
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
    
    var valueToAdd = 0
    var origValue = 0
    
    func inOrder(node: TreeNode?) {
        guard let node = node else { return }
        
        inOrder(node: node.right)
        
        origValue = node.val
        node.val += valueToAdd
        valueToAdd += origValue
        
        inOrder(node: node.left)
    }
    
    func convertBST(_ root: TreeNode?) -> TreeNode? {
        inOrder(node: root)
        return root
    }
    
    func run() {
        let root = TreeNode.create([5, 2, 13])
        let res = convertBST(root)
        
        print(res)
    }
}
