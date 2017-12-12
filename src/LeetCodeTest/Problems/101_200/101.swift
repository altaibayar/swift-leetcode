//
//  101.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 10/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_101: ProblemProtocol {

    func run() {
        print(isSymmetric(TreeNode.create([1,2,2,3,4,4,3])))
        print(isSymmetric(TreeNode.create([1,2,2,nil,3,nil,3])))
    }

    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true;
        }
        if root.left == nil && root.right == nil {
            return true;
        } else if root.left == nil || root.right == nil {
            return false;
        }

        var left = [TreeNode]();
        var right = [TreeNode]();

        left.append(root.left!);
        right.append(root.right!);

        while !left.isEmpty && !right.isEmpty {
            let l = left.popLast()!;
            let r = right.popLast()!;

            if l.val != r.val { return false; }

            if l.left != nil && r.right != nil {
                left.append(l.left!);
                right.append(r.right!);
            } else if (l.left == nil) != (r.right == nil) {
                return false;
            }

            if l.right != nil && r.left != nil {
                left.append(l.right!);
                right.append(r.left!);
            } else if (l.right == nil) != (r.left == nil) {
                return false;
            }
        }

        return left.isEmpty && right.isEmpty;
    }
}
