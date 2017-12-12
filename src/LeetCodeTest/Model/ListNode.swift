//
//  ListNode.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 09/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

extension ListNode {

    class func create(_ numbers: [Int]) -> ListNode? {
        if numbers.count == 0 { return nil; }

        let root: ListNode = ListNode(numbers[0]);
        var last = root;
        for i in 1 ..< numbers.count {
            let node = ListNode(numbers[i]);
            last.next = node;

            last = node;
        }

        return root;
    }

    func print() {
        var result = [String]();

        var current: ListNode? = self;
        while current != nil {
            result.append("\(current!.val)");
            current = current!.next;
        }

        Swift.print(result.joined(separator: " -> "));
    }
}
