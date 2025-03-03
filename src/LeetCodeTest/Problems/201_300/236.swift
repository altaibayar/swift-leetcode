//
//  236.swift
//  LeetCodeTest
//
//  Created by a on 03/03/2025.
//  Copyright © 2025 tsevealt. All rights reserved.
//
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

class Problem_236: ProblemProtocol {
    
    var result: TreeNode? = nil

    func recurse(_ current: TreeNode?, _ p: TreeNode, _ q: TreeNode) -> Bool {
        guard let current = current else { return false }
        
        let left = recurse(current.left, p, q) ? 1 : 0
        let right = recurse(current.right, p, q) ? 1 : 0
        let mid = p.val == current.val || q.val == current.val ? 1 : 0
        
        if left + right + mid >= 2 {
            result = current
        }
                
        return left + right + mid > 0;
    }
    
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        let _ = recurse(root, p!, q!)
        return result
    }
    
    func run() {
        print(lowestCommonAncestor(
            TreeNode.create([3,5,1,6,2,0,8,nil,nil,7,4]),
            TreeNode(5),
            TreeNode(1))?.val ?? "nil") // 3
        
        print(lowestCommonAncestor(
            TreeNode.create([3,5,1,6,2,0,8,nil,nil,7,4]),
            TreeNode(5),
            TreeNode(4))?.val ?? "nil") // 5

        print(lowestCommonAncestor(
            TreeNode.create([1,2]),
            TreeNode(1),
            TreeNode(2))?.val ?? "nil") // 1
    }
}
