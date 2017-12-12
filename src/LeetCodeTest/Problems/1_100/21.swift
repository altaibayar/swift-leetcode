//
//  21.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 09/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_21: ProblemProtocol {

    func run() {
        let l1 = ListNode.create([]);
        let l2 = ListNode.create([0]);

        mergeTwoLists(l1, l2)?.print();
    }

    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {

        var root: ListNode? = nil;
        var last: ListNode? = nil;

        var c1 = l1;
        var c2 = l2;

        while c1 != nil && c2 != nil {
            let v1 = c1!.val;
            let v2 = c2!.val;
            let node: ListNode?;

            if v1 < v2 {
                node = c1;
                c1 = c1?.next;
            } else {
                node = c2;
                c2 = c2?.next;
            }

            if root == nil {
                root = node;
                last = root;
            } else {
                last?.next = node;
                last = last?.next;
                last?.next = nil;
            }
        }

        if c1 != nil {
            if root == nil { return c1; }
            last?.next = c1;
        }
        else if c2 != nil {
            if root == nil { return c2; }
            last?.next = c2;
        }

        return root;
    }
}
