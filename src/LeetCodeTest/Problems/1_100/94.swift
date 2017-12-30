//
//  94.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 30/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_94: ProblemProtocol {
    func run() {

    }

    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]();

        guard let root = root else { return result; }

        var dfs: (TreeNode) -> () = { _ in
            print("stupid initializer");
        }
        
        dfs = { node in
            if node.left != nil {
                dfs(node.left!);
            }

            result.append(node.val);

            if node.right != nil {
                dfs(node.right!);
            }
        }

        dfs(root);

        return result;
    }
}
