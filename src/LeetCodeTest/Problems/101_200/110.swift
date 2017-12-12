//
//  110.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 10/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_110: ProblemProtocol {
    func run() {
//        print(isBalanced(TreeNode.create( [1] )));
        print(isBalanced(TreeNode.create( [1, nil, 3, 2] )));
//        print(isBalanced(TreeNode.create( [1,2,2,3,nil,nil,3,4,nil,nil,4] )));
    }

    func isBalanced(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true;
        }

        return height(root) != -10;
    }

    func height(_ root: TreeNode?) -> Int {
        if root == nil { return -1; }

        let l = height(root?.left);
        let r = height(root?.right);

        if l == -10 || r == -10 || abs(l - r) > 1 {
            return -10;
        }

        return 1 + max(l, r);
    }
}

