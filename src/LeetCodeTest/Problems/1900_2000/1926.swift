//
//  1926.swift
//  LeetCodeTest
//
//  Created by a on 12/06/2024.
//  Copyright © 2024 tsevealt. All rights reserved.
//

import Foundation

class Problem_1926: ProblemProtocol {
 
    func nearestExit(_ maze: [[Character]], _ entrance: [Int]) -> Int {
        guard !maze.isEmpty, !maze[0].isEmpty else {return -1}
        
        let R = maze.count
        let C = maze[0].count
        
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: C), count: R)
        var toVisit = [ entrance ]
        var result = -1
        
        while !toVisit.isEmpty {
            let delta = [[1, 0], [0, 1], [-1, 0], [0, -1]]
            let cur = toVisit.removeFirst()
            
            for d in delta {
                let newPos = [d[0] + cur[0], d[1] + cur[1]]
                
                let atCorner = newPos[0] == 0 || newPos[0] == C - 1 || newPos[1] == 0 || newPos[1] == R - 1
                let isStart = newPos[0] == entrance[0] && newPos[1] == entrance[1]
                
                if atCorner && !isStart {
                    
                }                
            }
        }
        
        return 0
    }
    
    func run() {
        print(nearestExit([["+","+",".","+"],[".",".",".","+"],["+","+","+","."]], [1,2]))
        print(nearestExit([["+","+","+"],[".",".","."],["+","+","+"]], [1,0]))
        print(nearestExit([[".","+"]], [0,0]))
    }
}
