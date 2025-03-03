//
//  314.swift
//  LeetCodeTest
//
//  Created by a on 03/03/2025.
//  Copyright © 2025 tsevealt. All rights reserved.
//

class Problem_314: ProblemProtocol {
    func verticalOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var dict = [Int: [Int]]()
        
        var queue: [(TreeNode, Int)] = []
        var minColumn = 0, maxColumn = 0
        queue.append((root, 0))

        while let (currentNode, currentColumn) = queue.first {
            let _ = queue.removeFirst()
            
            dict[currentColumn, default: []].append(currentNode.val)
            
            if let left = currentNode.left {
                queue.append((left, currentColumn - 1))
                minColumn = min(minColumn, currentColumn - 1)
            }
            
            if let right = currentNode.right {
                queue.append((right, currentColumn + 1))
                maxColumn = max(maxColumn, currentColumn + 1)
            }
        }
        
        var result = [[Int]]()
        for col in minColumn ... maxColumn {
            if let val = dict[col] {
                result.append(val)
            }
        }
        
        return result
    }

    func run() {
        // [[9],[3,15],[20],[7]]
        print(verticalOrder(TreeNode.create([3,9,20,nil,nil,15,7])))
        // [[4],[9],[3,0,1],[8],[7]]
        print(verticalOrder(TreeNode.create([3,9,8,4,0,1,7])))
        // [[4],[2,5],[1,10,9,6],[3],[11]]
        print(verticalOrder(TreeNode.create([1,2,3,4,10,9,11,nil,5,nil,nil,nil,nil,nil,nil,nil,6])))
    }
}
