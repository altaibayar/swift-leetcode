//
//  687.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 12/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_687: ProblemProtocol {
    func run() {
        print(longestUnivaluePath(TreeNode.create([5, 4, 5, 1, 1, nil, 5])));
        print(longestUnivaluePath(TreeNode.create([1, 4, 5, 4, 4, nil, 5])));
        print(longestUnivaluePath(TreeNode.create([1, 4, 5, 4, 4, 5, nil])));
    }

    var result = 0;

    func longestUnivaluePath(_ root: TreeNode?) -> Int {
        result = 0;

        dfs(root);
        return result;
    }

    @discardableResult
    func dfs(_ root: TreeNode?) -> Int {
        if root == nil { return 0; }

        var left: Int = dfs(root?.left);
        if root?.val == root?.left?.val {
            left += 1;
        } else {
            left = 0;
        }

        var right: Int = dfs(root?.right);
        if root?.val == root?.right?.val {
            right += 1;
        } else {
            right = 0;
        }

        if left + right > result {
            result = left + right;
        }

        return left > right ? left : right;
    }
}
