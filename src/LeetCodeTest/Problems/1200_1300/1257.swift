//
//  1257.swift
//  LeetCodeTest
//
//  Created by a on 11/06/2026.
//  Copyright © 2026 tsevealt. All rights reserved.
//

class Problem_1257: ProblemProtocol {
    func findSmallestRegion(_ regions: [[String]], _ region1: String, _ region2: String) -> String {
        var childToParent = [String: String]()
        
        // build parent
        for regionList in regions {
            if regionList.isEmpty { continue }
            
            let parent = regionList[0]
            for i in 1 ..< regionList.count {
               childToParent[regionList[i]] = parent
            }
        }
        
        // build tree
        var path = Set<String>()
        var current: String = region1
        while true {
            path.insert(current)
            if let parent = childToParent[current] {
                current = parent
            } else {
                break
            }
        }
        
        // check region2        
        current = region2
        while true {
            if path.contains(current) {
                return current
            }
            
            if let parent = childToParent[current] {
                current = parent
            } else {
                return ""
            }
            
        }

        return ""
    }

    func run() {
        print(
            findSmallestRegion(
                [
                    ["Earth", "North America", "South America"],
                    ["North America", "United States", "Canada"],
                    ["United States", "New York", "Boston"],
                    ["Canada", "Ontario", "Quebec"],
                    ["South America", "Brazil"],
                ],
                "Quebec",
                "New York"
            )
        )

        print(
            findSmallestRegion(
                [
                    ["Earth", "North America", "South America"],
                    ["North America", "United States", "Canada"],
                    ["United States", "New York", "Boston"],
                    ["Canada", "Ontario", "Quebec"],
                    ["South America", "Brazil"],
                ],
                "Canada",
                "South America"
            )
        )
    }
}
