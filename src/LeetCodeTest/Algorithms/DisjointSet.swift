//
//  DisjointSet.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 2019-08-27.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class DisjointSet<T> where T: Equatable & Hashable {

    class Node {
        let val: T
        var parent: Node?

        init(val: T) {
            self.val = val
        }
    }

    var nodes: [T: Node] = [:]

    func union(val1: T, val2: T) {
        let parent1 = find(val: val1)
        let parent2 = find(val: val2)

        if let parent1 = parent1, let parent2 = parent2 {
            parent1.parent = parent2
        } else if let parent1 = parent1 {
            let parent2 = Node(val: val2)
            nodes[val2] = parent2
            parent2.parent = parent1
        } else if let parent2 = parent2 {
            let parent1 = Node(val: val1)
            nodes[val1] = parent1
            parent1.parent = parent2
        } else {
            let parent1 = Node(val: val1)
            let parent2 = Node(val: val2)
            nodes[val1] = parent1
            nodes[val2] = parent2

            parent2.parent = parent1
        }
    }

    func find(val: T) -> Node? {
        guard var child = nodes[val] else {
            return nil
        }

        var current: Node = child
        while current.parent != nil {
            current = current.parent!
        }

        while child.parent != nil {
            let tmp = child.parent
            child.parent = current
            child = tmp!
        }

        return current
    }
}

extension DisjointSet.Node: Equatable {

    static func == (lhs: DisjointSet<T>.Node, rhs: DisjointSet<T>.Node) -> Bool {
        return lhs.val == rhs.val
    }
}
