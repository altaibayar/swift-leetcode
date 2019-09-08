//
//  973.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 2019-09-08.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_973: ProblemProtocol {

    func kClosest(_ points: [[Int]], _ K: Int) -> [[Int]] {
        return Array<[Int]>(points.sorted { (p1, p2) -> Bool in
            let d1 = sqrt(Float(p1[0] * p1[0]) + Float(p1[1] * p1[1]))
            let d2 = sqrt(Float(p2[0] * p2[0]) + Float(p2[1] * p2[1]))
            return d1 < d2
        }.prefix(upTo: K))
     }

    func run() {
        print(kClosest([[3,3],[5,-1],[-2,4]], 2))
    }
}
