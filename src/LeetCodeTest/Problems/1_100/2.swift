//
//  2.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 31/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_2: ProblemProtocol {
    func run() {
        addTwoNumbers(ListNode.create([2, 4, 3]), ListNode.create([5, 6, 4]))?.print();
        addTwoNumbers(ListNode.create([5]), ListNode.create([5]))?.print()
        addTwoNumbers(ListNode.create([2, 4, 3]), nil)?.print()
        addTwoNumbers(ListNode.create([2, 4, 3]), ListNode.create([0, 0, 1]))?.print()
        addTwoNumbers(ListNode.create([1]), ListNode.create([1]))?.print()
        addTwoNumbers(ListNode.create([]), ListNode.create([]))?.print()
    }

    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1, l2 = l2;

        if l1 == nil { return l2; }
        if l2 == nil { return l1; }

        var result: ListNode? = nil;
        var last: ListNode? = nil;
        var carry: Int = 0;

        while l1 != nil || l2 != nil {
            let v1 = l1 == nil ? 0 : l1!.val;
            let v2 = l2 == nil ? 0 : l2!.val;

            let current = ListNode(v1 + v2 + carry);
            if current.val >= 10 {
                carry = 1;
                current.val %= 10;
            } else {
                carry = 0;
            }

            last?.next = current;
            last = current;

            if result == nil {
                result = last;
            }

            l1 = l1?.next;
            l2 = l2?.next;
        }

        if carry > 0 {
            let current = ListNode(carry);
            last?.next = current;
        }

        return result;
    }
}
