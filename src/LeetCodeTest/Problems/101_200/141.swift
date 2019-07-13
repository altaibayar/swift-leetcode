//
//  141.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 2019-07-13.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_141: ProblemProtocol {

    //Made in Java
    /*

     public boolean hasCycle(ListNode head) {
         if (head == null) {
            return false;
         }

         ListNode slow = head;
         ListNode fast = head.next;

         while (slow != null && fast != null) {
             slow = slow.next;
             if (fast.next != null) {
                fast = fast.next.next;
             } else {
                return false;
            }

             if (slow == null || fast == null) { return false; }
             if (slow.val == fast.val) { return true; }
         }

         return false;
     }

     */

    func run() {

    }
}
