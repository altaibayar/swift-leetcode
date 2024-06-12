//
//  841.swift
//  LeetCodeTest
//
//  Created by a on 12/06/2024.
//  Copyright © 2024 tsevealt. All rights reserved.
//

import Foundation

class Problem_841: ProblemProtocol {
 
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        guard !rooms.isEmpty else { return true }
        
        var visited = Set<Int>()
        var toVisit = Set<Int>()
        
        visited.insert(0)
        toVisit = toVisit.union(rooms[0])
                
        while !toVisit.isEmpty {
            let first = toVisit.removeFirst()
            if visited.contains(first) {
                continue
            }
            
            visited.insert(first)
            toVisit = toVisit.union(rooms[first])
        }
        
        return rooms.count == visited.count
    }
    
    func run() {
        print(canVisitAllRooms([[1],[2],[3],[]]))
        print(canVisitAllRooms([[1,3],[3,0,1],[2],[0]]))
    }
}
