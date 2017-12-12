//
//  107.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 10/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_107: ProblemProtocol {
    func run() {
        print(levelOrderBottom(TreeNode.create([3,9,20,nil,nil,15,7])))
    }

    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return [];
        }

        var lastDepth: Int = -1;
        var result: [[Int]] = [];

        var queue = [(TreeNode, Int)]();
        queue.append((root, 0));
        while !queue.isEmpty {
            let current = queue.removeFirst();
            if current.1 != lastDepth {
                result.insert([current.0.val], at: 0);
                lastDepth = current.1;
            } else {
                result[0].append(current.0.val);
            }

            if let left = current.0.left {
                queue.append( (left, current.1 + 1) );
            }
            if let right = current.0.right {
                queue.append( (right, current.1 + 1) );
            }
        }

        return result;
    }
}
