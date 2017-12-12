//
//  236.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 09/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_236: ProblemProtocol {
    func run() {
        print(isPalindrome(ListNode.create([1])));
        print(isPalindrome(ListNode.create([1, 2, 2, 1])));
        print(isPalindrome(ListNode.create([1, 2, 3, 2, 1])));
        print(isPalindrome(ListNode.create([1, 2, 3, 4, 2, 1])));
    }

    func isPalindrome(_ head: ListNode?) -> Bool {
        if head == nil { return true; }

        var fast: ListNode? = head, slow: ListNode? = head;
        while fast != nil && fast?.next != nil {
            fast = fast?.next?.next;
            slow = slow?.next;
        }

        if fast != nil {
            slow = slow?.next;
        }

        slow = reverseList(slow);
        fast = head;

        while slow != nil {
            if slow?.val != fast?.val {
                return false;
            }

            slow = slow?.next;
            fast = fast?.next;
        }

        return true;
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
