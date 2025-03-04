//
//  938.swift
//  LeetCodeTest
//
//  Created by a on 04/03/2025.
//  Copyright © 2025 tsevealt. All rights reserved.
//

class Problem_938: ProblemProtocol {

    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        guard let root = root else { return 0 }

        var result = 0
        
        var stack = [TreeNode]()
        stack.append(root)
        
        while let last = stack.popLast() {
            if last.val >= low && last.val <= high {
                result += last.val
                
                if let left = last.left { stack.append(left) }
                if let right = last.right { stack.append(right) }
                
            } else if last.val < low, let right = last.right {
                stack.append(right)
                
            } else if last.val > high, let left = last.left {
                stack.append(left)
            }
        }
        
        return result
    }
    
    func run() {
        print(rangeSumBST(TreeNode.create([10,5,15,3,7,nil,18]), 7, 15)) // 32
        print(rangeSumBST(TreeNode.create([10,5,15,3,7,13,18,1,nil,6]), 6, 10)) // 23
    }
}
