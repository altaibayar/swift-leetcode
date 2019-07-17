//
//  437.swift
//  LeetCodeTest
//
//  Created by Altai Tseveenbayar on 2019-07-17.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_437: ProblemProtocol {
    
    func hasSum(_ sum: Int, array: [Int]) -> Int {
        var copy = array
        
        var result = 0
        var acc = 0
        while !copy.isEmpty {
            acc += copy.removeLast()
            if acc == sum { result += 1 }
        }
        
        return result
    }
    
    func rec(_ node: TreeNode?, _ sum: Int, _ ongoing: [Int]) -> Int {
        guard let node = node else { return 0 }
        
        var newOngoing = ongoing
        newOngoing.append(node.val)
        
        var result = hasSum(sum, array: newOngoing)
        result += rec(node.left, sum, newOngoing)
        result += rec(node.right, sum, newOngoing)

        return result
    }
    
    func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
        return rec(root, sum, [])
    }
    
    func run() {
//        print(pathSum(TreeNode.create([10, 5, -3, 3, 2, nil, 11, 3, -2, nil, 1], 8))
        print(pathSum(TreeNode.create([0, 1, 1]), 1))
    }
}
