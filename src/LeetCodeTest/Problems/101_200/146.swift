//
//  146.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 2019-07-27.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_146: ProblemProtocol {

    class LRUCache {

        private let capacity: Int
        private var dict: [Int: Node] = [:]
        private var firstNode: Node?
        private var lastNode: Node?

        init(_ capacity: Int) {
            self.capacity = capacity
        }

        func get(_ key: Int) -> Int {
            guard capacity > 0 else {
                return -1
            }

            if let node = dict[key] {
                self.makeFirst(node: node)
                return node.val
            }

            return -1
        }

        func put(_ key: Int, _ value: Int) {
            guard capacity > 0 else {
                return
            }

            let node: Node
            if dict[key] != nil {
                node = dict[key]!
                node.val = value
            } else {
                node = Node(key: key, val: value)
                dict[key] = node
            }

            self.makeFirst(node: node)

            while dict.count > capacity {
                removeLast()
            }
        }

        private func makeFirst(node: Node) {
            self.detach(node: node)
            node.next = firstNode
            firstNode?.prev = node
            firstNode = node

            if dict.count == 1 {
                firstNode = node
                lastNode = node
            }
        }

        private func detach(node: Node) {
            node.prev?.next = node.next
            node.next?.prev = node.prev
            if node === lastNode {
                lastNode = node.prev
            }

            if node === firstNode {
                firstNode = node.next
            }
        }

        private func removeLast() {
            guard let last = self.lastNode else {
                return
            }

            dict.removeValue(forKey: last.key)

            let prev = last.prev
            prev?.next = nil
            last.prev = nil
            lastNode = prev
        }

        class Node {
            let key: Int
            var val: Int
            var prev: Node?
            var next: Node?

            init(key: Int, val: Int) {
                self.key = key
                self.val = val
            }
        }
    }

    func run() {
        let cache = LRUCache(2)
        cache.put(1, 1);
        cache.put(2, 2);
        cache.put(3, 3);
        print(cache.get(1))
        print(cache.get(3))
        print(cache.get(3))
        print(cache.get(3))
        cache.put(3, 4);
    }
}

extension Problem_146.LRUCache: CustomDebugStringConvertible, CustomStringConvertible {
    var description: String {
        return debugDescription
    }

    var debugDescription: String {
        return """
        First: \(firstNode?.debugDescription ?? "nil")
        Last: \(lastNode?.description ?? "nil")
        Dict: \(dict.count)
        """
    }
}

extension Problem_146.LRUCache.Node: CustomDebugStringConvertible, CustomStringConvertible {
    var description: String {
        return debugDescription
    }

    var debugDescription: String {
        return "{key: \(key), val: \(val)} { next: \(self.next?.debugDescription ?? "nil") }"
    }
}
