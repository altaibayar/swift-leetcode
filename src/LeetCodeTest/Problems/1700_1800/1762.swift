//
//  1762.swift
//  LeetCodeTest
//
//  Created by a on 05/03/2025.
//  Copyright © 2025 tsevealt. All rights reserved.
//

class Problem_1762: ProblemProtocol {
    func findBuildings(_ heights: [Int]) -> [Int] {
        guard !heights.isEmpty else { return [] }
        guard heights.count > 1 else { return [0] }
        
        var currentMax = Int.min
        
        var result = [Int]()
        for i in stride(from: heights.count - 1, through: 0, by: -1) {
            if heights[i] > currentMax {
                result.append(i)
                currentMax = heights[i]
            }
        }
        
        return result.reversed()
    }
        
    func run() {
        print(findBuildings([4,2,3,1]))
        print(findBuildings([4,3,2,1]))
        print(findBuildings([1,3,2,4]))
    }
}
