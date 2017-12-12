//
//  530.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 10/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_530: ProblemProtocol {

    func run() {

    }

    var minDiff = Int.max;
    var previousNode: TreeNode? = nil;
    func getMinimumDifference(_ root: TreeNode?) -> Int {
        inorder(root);
        return minDiff;
    }

    func inorder(_ root: TreeNode?) {
        guard let root = root else { return; }

        inorder(root.left);

        if let prev = previousNode {
            let diff = abs(prev.val - root.val);
            if diff < minDiff { minDiff = diff; }
        }

        previousNode = root;
        inorder(root.right);
    }
}
