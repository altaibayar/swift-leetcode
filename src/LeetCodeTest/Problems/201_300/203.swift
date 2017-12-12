//
//  203.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 09/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_203: ProblemProtocol {
    func run() {
        removeElements(ListNode.create([1,2,6,3,4,5,6]), 6)?.print();
        removeElements(ListNode.create([6, 1, 6]), 6)?.print();
    }

    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        var root: ListNode? = nil;
        var last: ListNode? = nil;

        var current = head;
        while current != nil {
            if current!.val != val {
                if root == nil { root = current; }
                last?.next = current;
                last = current;
            }

            current = current?.next;
        }

        last?.next = nil;
        return root;
    }
}
