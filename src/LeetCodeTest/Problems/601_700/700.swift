//
//  700.swift
//  LeetCodeTest
//
//  Created by a on 12/06/2024.
//  Copyright © 2024 tsevealt. All rights reserved.
//

import Foundation

class Problem_700: ProblemProtocol {
    
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else { return nil }
        
        var stack: [TreeNode] = [root]
        while !stack.isEmpty {
            let top = stack.removeLast()
            if top.val == val { return top }
            
            if let left = top.left { stack.append(left) }
            if let right = top.right { stack.append(right) }
        }
        
        return nil
    }
    
    func run() {
        print(searchBST(TreeNode.create([4,2,7,1,3]), 2)?.val)
        print(searchBST(TreeNode.create([4,2,7,1,3]), 5)?.val)
    }
}
