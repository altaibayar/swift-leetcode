//
//  83.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 09/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_83: ProblemProtocol {
    func run() {
        deleteDuplicates(ListNode.create([]))?.print();
        deleteDuplicates(ListNode.create([1, 1]))?.print();
        deleteDuplicates(ListNode.create([1, 2]))?.print();
        deleteDuplicates(ListNode.create([1, 1, 2]))?.print();
        deleteDuplicates(ListNode.create([1, 1, 2, 3, 3]))?.print();
    }

    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head == nil { return nil; };

        var previous = head;
        var current = head!.next;
        while current != nil {
            if previous!.val != current!.val {
                previous!.next = current;
                previous = previous?.next;
            }

            current = current?.next;
        }

        previous?.next = nil;
        return head;
    }
}
