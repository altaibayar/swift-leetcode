//
//  24.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 31/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_24: ProblemProtocol {
    func run() {
        swapPairs(ListNode.create([1, 2, 3, 4]))?.print();
        swapPairs(ListNode.create([1, 2, 3, 4, 5]))?.print();
        swapPairs(ListNode.create([1, 2]))?.print();
        swapPairs(ListNode.create([1]))?.print();
        swapPairs(ListNode.create([]))?.print();
    }

    func swapPairs(_ head: ListNode?) -> ListNode? {
        if head == nil { return head; }
        var result: ListNode? = nil;

        var first = head;
        var second = head?.next;

        var last: ListNode? = nil;

        while second != nil {
            if result == nil {
                result = second;
            }

            first?.next = second?.next;
            second?.next = first;
            last?.next = second;

            last = first;

            first = first?.next;
            second = first?.next;
        }

        if result == nil {
            result = head;
        }

        return result;
    }
}
