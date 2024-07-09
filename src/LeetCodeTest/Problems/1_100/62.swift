//
//  62.swift
//  LeetCodeTest
//
//  Created by a on 09/07/2024.
//  Copyright © 2024 tsevealt. All rights reserved.
//

import Foundation

class Problem_62: ProblemProtocol {

    func run() {
        print(uniquePaths(4, 3))
    }
    
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var arr: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)
        
        for i in 0 ..< n {
            for j in 0 ..< m {
                if i == 0 || j == 0 {
                    arr[i][j] = 1
                } else {
                    arr[i][j] = arr[i - 1][j] + arr[i][j - 1]
                }
            }
        }
        
        return arr[n - 1][m - 1]
    }
}
