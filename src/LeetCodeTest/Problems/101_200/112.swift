//
//  112.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 2019-01-26.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_112: ProblemProtocol {
 
    func run() {
        print(hasPathSum(TreeNode.create([5, 4, 8, 11, nil, 13, 4, 7, 2, nil, nil, nil, 1]), 26))
        print(hasPathSum(TreeNode.create([5, 4, 8, 11]), 20))
        print(hasPathSum(TreeNode.create([1, 2]), 3))
        print(hasPathSum(TreeNode.create([]), 0))
    }
    
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        guard let root = root else { return false }
        return goDeep(root: root, sum: sum)
    }
    
    func goDeep(root: TreeNode, sum: Int) -> Bool {
        let val = sum - root.val
        
        if let left = root.left, let right = root.right {
            return goDeep(root: left, sum: val) || goDeep(root: right, sum: val)
        } else if let left = root.left {
            return goDeep(root: left, sum: val)
        } else if let right = root.right {
            return goDeep(root: right, sum: val)
        } else {
            return val == 0
        }
    }
}
