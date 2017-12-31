//
//  19.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 31/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_19: ProblemProtocol {
    func run() {
        removeNthFromEnd(ListNode.create([1, 2, 3, 4, 5]), 2)?.print();

        print("---");
        removeNthFromEnd(ListNode.create([1]), 1)?.print();
        removeNthFromEnd(ListNode.create([1, 2]), 2)?.print();
        removeNthFromEnd(ListNode.create([1, 2, 3]), 3)?.print();

        print("---");
        removeNthFromEnd(ListNode.create([1]), 1)?.print();
        removeNthFromEnd(ListNode.create([1, 2]), 1)?.print();
        removeNthFromEnd(ListNode.create([1, 2, 3]), 1)?.print();
    }

    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        if head == nil || n == 0 { return head; }

        var head = head;
        var first: ListNode? = head;
        var second: ListNode? = head;

        for _ in 0 ..< n {
            second = second?.next;
        }

        while second?.next != nil {
            first = first?.next;
            second = second?.next;
        }

        if second == nil {
            head = head?.next;
        } else {
            first?.next = first?.next?.next;
        }

        return head;
    }
}
