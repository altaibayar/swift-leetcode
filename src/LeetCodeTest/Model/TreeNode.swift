//
//  TreeNode.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 10/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

extension TreeNode {
    class func create(_ vals: [Int?]) -> TreeNode? {
        guard vals.count > 0 else { return nil; }

        var nodes = [TreeNode?](repeating: nil, count: vals.count);
        for (i, v) in vals.enumerated() {
            if let v = v {
                nodes[i] = TreeNode(v);
            }
        }

        for (i, n) in nodes.enumerated() {
            if let n = n {
                let i1 = i * 2 + 1;
                n.left = i1 < nodes.count ? nodes[i1] : nil;

                let i2 = i * 2 + 2;
                n.right = i2 < nodes.count ? nodes[i2] : nil;
            }
        }

        return nodes[0];
    }
}
