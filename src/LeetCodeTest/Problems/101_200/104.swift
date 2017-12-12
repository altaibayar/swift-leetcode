//
//  104.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 10/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_104: ProblemProtocol {
    func run() {
        print(maxDepth(TreeNode.create([1, 2, 2,3,4,4,3])))
    }

    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0;
        }

        var stack = [(TreeNode, Int)]();
        stack.append((root, 1));

        var max = 0;
        while !stack.isEmpty {
            let current = stack.popLast()!;
            if current.1 > max {
                max = current.1;
            }

            if let left = current.0.left {
                stack.append((left, current.1 + 1));
            }
            if let right = current.0.right {
                stack.append((right, current.1 + 1));
            }
        }

        return max;
    }
}
