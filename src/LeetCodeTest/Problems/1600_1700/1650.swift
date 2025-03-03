//
//  1650.swift
//  LeetCodeTest
//
//  Created by a on 03/03/2025.
//  Copyright © 2025 tsevealt. All rights reserved.
//

class Problem_1650: ProblemProtocol {
    class Node {
        public var val: Int
        public var left: Node?
        public var right: Node?
        public var parent: Node?
        public init(_ val: Int) {
            self.val = val
            self.left = nil
            self.right = nil
            self.parent = nil
        }
    }
    
    
    func lowestCommonAncestor(_ p: Node?,_ q: Node?) -> Node? {
        var p = p
        var q = q
        
        var parents = [Int: Node]()
        while let tmp = p {
            parents[tmp.val] = p
            p = p?.parent
        }
        
        while let tmp = q {
            if let common = parents[tmp.val] {
                return common
            }
            q = q?.parent
        }
        
        return nil
    }
    
    func run() {
        
    }
}
