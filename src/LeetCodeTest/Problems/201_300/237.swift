//
//  237.swift
//  LeetCodeTest
//
//  Created by Altai Tseveenbayar on 2019-07-17.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_237: ProblemProtocol {
    func deleteNode(_ node: ListNode?) {
        guard let node = node, let next = node.next else { return }
        
        node.val = next.val
        node.next = next.next
    }
    
    
    func run() {

        /* Java
 
         public void deleteNode(ListNode node) {
             if (node == null || node.next == null) { return; }
         
             while (node.next.next != null) {
                 node.val = node.next.val;
                 node.next = node.next;
         
                 node = node.next;
             }
         
             node.val = node.next.val;
             node.next = null;
         }
         
         */
        
    }
}
