//
//  118.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 24/01/2019.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_188: ProblemProtocol {
    func run() {

        let result = generate(10)
        for a in result {
            print(a)
        }
    }

    func generate(_ numRows: Int) -> [[Int]] {
        guard numRows >= 0 else { return [ ] }

        if numRows == 0 {
            return [ ]
        } else if numRows == 1 {
            return [ [1] ]
        } else if numRows == 2 {
            return [ [1], [1, 1] ]
        }

        var result = [[Int]]()
        result.append( [1] )
        result.append( [1, 1] )

        var previous: [Int] = [ 1, 1 ]

        for _ in 3 ... numRows {
            var current: [Int] = [ 1 ]

            for i in 1 ... previous.count - 1{
                let left = previous[i - 1]
                let right = previous[i]

                current.append(left + right)
            }

            current.append( 1 )
            result.append(current)

            previous = current
        }

        return result
    }
}
