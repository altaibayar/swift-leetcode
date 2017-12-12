//
//  108.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 10/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_108: ProblemProtocol {
    func run() {
        print(sortedArrayToBST([-10,-3,0,5,9]) ?? "NULL");
    }

    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        if nums.count == 0 {
            return nil;
        }

        let root = createTree(array: nums, leftIdx: 0, rightIdx: nums.count - 1);
        return root;
    }

    func createTree(array: [Int], leftIdx: Int, rightIdx: Int) -> TreeNode? {
        if leftIdx > rightIdx {
            return nil;
        }

        let idx = (leftIdx + rightIdx) / 2;
        let node = TreeNode(array[idx]);

        node.left = createTree(array: array, leftIdx: leftIdx, rightIdx: idx - 1);
        node.right = createTree(array: array, leftIdx: idx + 1, rightIdx: rightIdx);

        return node;
    }
}
