//
//  LinkedListLRU.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 2021-05-02.
//  Copyright © 2021 tsevealt. All rights reserved.
//

import Foundation

class LinkedListLRU<T> where T: Hashable {

    class Node: Equatable {
        static func == (lhs: LinkedListLRU<T>.Node, rhs: LinkedListLRU<T>.Node) -> Bool {
            return lhs.val == rhs.val
        }

        let val: T
        var prev: Node? = nil
        var next: Node? = nil

        init(val: T) {
            self.val = val
        }
    }

    let maxSize: Int

    var map: [T: Node] = [:]
    var root: Node? = nil
    var tail: Node? = nil

    init(maxSize: Int) {
        self.maxSize = maxSize
    }

    func get(_ key: T) -> T? {
        guard let node = map[key] else {
            return nil
        }

        remove(element: node)
        addHeader(element: node)

        return node.val
    }

    func put(_ key: Int, _ value: T) {
        let current: Node

        if map[value] != nil {
            current = map[value]!
        } else {
            current = Node(val: value)
        }


        remove(element: current)
        addHeader(element: current)

        if map.count > maxSize {
            remove(element: tail!)
        }
    }

    private func remove(element: Node) {
        element.next?.prev = element.prev
        element.prev = element.next
        map.removeValue(forKey: element.val)

        if element == root {
            root = element.next
        }

        if element == tail {
            tail = element.prev
        }
    }

    private func addHeader(element: Node) {
        element.next = root
        root?.prev = element
        element.prev = nil

        if map.count == 1 {
            root = element
            tail = element
        }
    }
}

class LRUCache: LinkedListLRU<Int> {

    init(_ capacity: Int) {
        super.init(maxSize: capacity)
    }

    override func get(_ key: Int) -> Int {
        return super.get(key) ?? -1;
    }
}
