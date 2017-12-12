//
//  111.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 10/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_111: ProblemProtocol {
    func run() {
//        print(minDepth(TreeNode.create( [1,2,2,3,nil,nil,3,4,nil,nil,4] )));
//        print(minDepth(TreeNode.create( [0] )));
        print(minDepth(TreeNode.create( [1, 2] )));
    }

    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0;
        }

        let l = minDepth(root.left);
        let r = minDepth(root.right);

        return l == 0 || r == 0 ? l + r + 1 : min(l, r) + 1;
    }
}
