//
//  543.swift
//  LeetCodeTest
//
//  Created by Altai Tseveenbayar on 2019-07-23.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_543: ProblemProtocol {
    
    var result = 0
    
    func maxLength(node: TreeNode?) -> Int {
        guard let node = node else { return 0 }
        
        let left = maxLength(node: node.left)
        let right = maxLength(node: node.right)
        
        if left + right > result {
            result = left + right
        }
        
        return max(left, right) + 1
    }
    
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        let _ = maxLength(node: root)
        return result
    }

    func run() {
        let root = TreeNode.create([1, 2, 3, 4, 5])
        print(diameterOfBinaryTree(root))
    }
}
