//
//  251.swift
//  LeetCodeTest
//
//  Created by a on 02/07/2026.
//  Copyright © 2026 tsevealt. All rights reserved.
//

class Problem_251: ProblemProtocol {

    class Vector2D {

        let vec: [[Int]]

        private var i = 0
        private var j = 0

        init(_ vec: [[Int]]) {
            self.vec = vec
            while i < vec.count && vec[i].isEmpty {
                i += 1
            }
        }

        func next() -> Int {
            let result = vec[i][j]

            j += 1
            if j >= vec[i].count {
                i += 1
                j = 0
            }

            while i < vec.count && vec[i].isEmpty {
                i += 1
            }

            return result
        }

        func hasNext() -> Bool {
            guard i < vec.count else { return false }

            guard j < vec[i].count else { return false }

            return true
        }
    }

    func run() {
//        let v = Vector2D([[1, 2], [3], [4]])
        let v = Vector2D([[], [3]])

        
        while v.hasNext() {
            print(v.next())
        }
    }
}
