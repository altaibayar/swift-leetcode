//
//  BinarySearchTree.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 2021-05-04.
//  Copyright © 2021 tsevealt. All rights reserved.
//

import Foundation

class BinarySearchTree<T: Comparable> {
    private class Node {
        var left: Node?
        var right: Node?
        let value: T

        init(value: T) { self.value = value }
    }

    func insert(value: T) { }
    func delete(value: T) { }
    func exists(value: T) -> Bool { return true }
}
