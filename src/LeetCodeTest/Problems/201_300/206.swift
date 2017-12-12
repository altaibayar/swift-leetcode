//
//  206.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 09/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_206: ProblemProtocol {
    func run() {
        reverseList(ListNode.create([]))?.print();
        reverseList(ListNode.create([1]))?.print();
        reverseList(ListNode.create([1, 2, 3, 4]))?.print();
    }

    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil { return nil; }

        var root: ListNode? = nil;
        var current = head;
        while current != nil {
            let next = current?.next;

            current?.next = root;
            root = current;

            current = next;
        }

        return root;
    }
}
