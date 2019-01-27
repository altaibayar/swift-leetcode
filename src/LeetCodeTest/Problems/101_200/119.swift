//
//  119.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 2019-01-26.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_119: ProblemProtocol {
 
    func run() {
        print(getRow(0))
        print(getRow(1))
        print(getRow(2))
        print(getRow(3))
        print(getRow(4))
        print(getRow(5))
        print(getRow(6))
        print(getRow(7))
        print(getRow(8))
        print(getRow(9))
//        print(getRow(21))
//        print(getRow(33))
    }
    
    func getRow(_ rowIndex: Int) -> [Int] {
        guard rowIndex >= 0, rowIndex <= 33 else { return [ ] }
        if rowIndex == 0 { return [1] }
        
        var previousRow: [Int] = [1]
        
        for r in 1 ... rowIndex {
            var currentRow = [Int]()
            
            for i in 0 ... r {
                let left = i == 0 ? 0 : previousRow[i - 1]
                let right = i == previousRow.count ? 0 : previousRow[i]
                currentRow.append(left + right)
            }
            
            previousRow = currentRow
        }
        
        return previousRow
    }
}
