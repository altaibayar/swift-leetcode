//
//  23.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 2019-07-27.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_23: ProblemProtocol {
    /**
     * Definition for singly-linked list.
     * public class ListNode {
     *     public var val: Int
     *     public var next: ListNode?
     *     public init(_ val: Int) {
     *         self.val = val
     *         self.next = nil
     *     }
     * }
     */

    func merge2Lists(list1: ListNode, list2: ListNode) -> ListNode {
        let root: ListNode = list1.val < list2.val ? list1 : list2

        var list1: ListNode? = list1
        var list2: ListNode? = list2

        var current: ListNode!
        while list1 != nil && list2 != nil {

            if list1!.val < list2!.val {
                if current == nil {
                    current = list1
                } else {
                    current.next = list1
                    current = current.next
                }

                list1 = list1?.next
            } else {
                if current == nil {
                    current = list2
                } else {
                    current.next = list2
                    current = current.next
                }
                list2 = list2?.next
            }
        }

        if let list1 = list1 {
            current.next = list1
        } else if let list2 = list2 {
            current.next = list2
        }

        return root
    }

    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var lists = lists.compactMap { $0 }

        var i = 1

        while i < lists.count {
            var start = 0
            var end = (lists.count - 1) / i

            while start < end {
                lists[start] = merge2Lists(list1: lists[start], list2: lists[end])

                start += 1
                end -= 1
            }

            i *= 2
        }

        return lists.first
    }

    func run() {
        mergeKLists([ nil, nil ])?.print()
        mergeKLists([ nil ])?.print()
        mergeKLists([ ])?.print()
        mergeKLists([
            ListNode.create([1]),
            ListNode.create([2])
            ])?.print()
        mergeKLists([
            ListNode.create([]),
            ListNode.create([2, 6])
            ])?.print()
        mergeKLists([
            nil,
            ListNode.create([]),
            ListNode.create([2, 6])
            ])?.print()

        mergeKLists([
            nil,
            ListNode.create([]),
            ListNode.create([2, 6])
            ])?.print()

        mergeKLists([
            ListNode.create([1, 4, 5]),
            ListNode.create([1, 3, 4]),
            ListNode.create([2, 6])
            ])?.print()
    }
}

/*
 def mergeKLists(self, lists: List[ListNode]) -> ListNode:
     if not lists:
        return None
     i = 1
     while i < len(lists):
         start = 0
         end = (len(lists)-1)//i

         while start < end:
             lists[start] = self.mergeTwo(lists[start], lists[end])
             start += 1
             end -= 1
         i *= 2
     return lists[0]

 */
