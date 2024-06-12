//
//  2095.swift
//  LeetCodeTest
//
//  Created by a on 12/06/2024.
//  Copyright © 2024 tsevealt. All rights reserved.
//

import Foundation

class Problem_2095: ProblemProtocol {
    
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init() { self.val = 0; self.next = nil; }
        public init(_ val: Int) { self.val = val; self.next = nil; }
        public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    }
    
    func deleteMiddle(_ head: ListNode?) -> ListNode? {
        var single = head
        var double = head
        
        var lastSingle = head
        while double?.next != nil {
            lastSingle = single
            single = single?.next
            double = double?.next?.next
        }
        
        if lastSingle === single {
            return nil
        } else {
            lastSingle?.next = single?.next
            return head
        }
    }
    
    func run() {
        prinHead(deleteMiddle(createHead([1,3,4,7,1,2,6])))
        prinHead(deleteMiddle(createHead([1,2,3,4])))
        prinHead(deleteMiddle(createHead([2,1])))
        prinHead(deleteMiddle(createHead([1])))
    }
    
    private func createHead(_ arr: [Int]) -> ListNode {
        let nodes = arr.map { ListNode($0) }
        (1 ..< nodes.count).forEach { nodes[$0 - 1].next = nodes[$0] }
        
        return nodes[0]
    }
    
    private func prinHead(_ head: ListNode?) {
        var arr = [Int]()
        var curr = head
        while curr != nil {
            arr.append(curr!.val)
            curr = curr?.next
        }
        
        print(arr)
    }
}
