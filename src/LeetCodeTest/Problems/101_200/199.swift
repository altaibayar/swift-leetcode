//
//  199.swift
//  LeetCodeTest
//
//  Created by a on 12/06/2024.
//  Copyright © 2024 tsevealt. All rights reserved.
//

import Foundation

class Problem_199: ProblemProtocol {
 
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        
        var result = [Int]()
        var queue: [TreeNode] = [root]

        while !queue.isEmpty {
            result.append(queue.last!.val)            
            queue = queue.flatMap { [$0.left, $0.right] }.compactMap { $0 }
        }

        return result
    }
    
    func run() {
        print(rightSideView(TreeNode.create([1,2,3,nil,5,nil,4])))
        print(rightSideView(TreeNode.create([1,nil,3])))
        print(rightSideView(TreeNode.create([])))
        print(rightSideView(TreeNode.create([1, 2])))
    }
}
