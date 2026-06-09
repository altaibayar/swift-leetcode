//
//  721.swift
//  LeetCodeTest
//
//  Created by a on 09/06/2026.
//  Copyright © 2026 tsevealt. All rights reserved.
//

class Problem_721: ProblemProtocol {
    class DisjointSet {
        var parents: [Int]
        var size: [Int]
        
        init(n: Int) {
            parents = Array(0 ..< n)
            size = Array(repeating: 1, count: n)
        }
        
        func find(_ x: Int) -> Int {
            var result = x
            
            // Find parent
            while result != parents[result] {
                result = parents[result]
            }
            
            // Relax
            var current = x
            while current != parents[current] {
                let next = parents[current]
                parents[current] = result
                
                current = next
            }

            return result
        }
        
        func union(_ x: Int, _ y: Int) {
            let pX = find(x)
            let pY = find(y)
            
            if pX == pY { return }
            
            if size[pX] > size[pY] {
                parents[pY] = pX
                size[pX] += size[pY]
            } else {
                parents[pX] = pY
                size[pY] += size[pX]
            }
        }
    }
    
    
    func accountsMerge(_ accounts: [[String]]) -> [[String]] {
        let n = accounts.count
        
        var emailIndexes = [String: Int]()
        let disjointSet = DisjointSet(n: n)
        
        for (accountIdx, account) in accounts.enumerated() {
            for i in 1 ..< account.count {
                let email = account[i]
                
                if let oldId = emailIndexes[email] {
                    disjointSet.union(accountIdx, oldId)
                } else {
                    emailIndexes[email] = accountIdx
                }
            }
        }
        
        var emails = [Int: Set<String>]()
        for accountIdx in 0 ..< n {
            let parent = disjointSet.find(accountIdx)
            for emailIdx in 1 ..< accounts[accountIdx].count {
                let email = accounts[accountIdx][emailIdx]
                emails[parent, default: Set<String>()].insert(email)
            }
        }
        
        var result = [[String]]()
        
        for (id, allEmails) in emails {
            let name = accounts[id][0]
            let sortedEmails = allEmails.sorted()
            
            result.append([name] + sortedEmails)
        }
        
        return result
    }

    func run() {
        print(
            accountsMerge(
                [
                    ["John", "johnsmith@mail.com", "john_newyork@mail.com"],
                    ["John", "johnsmith@mail.com", "john00@mail.com"], ["Mary", "mary@mail.com"],
                    ["John", "johnnybravo@mail.com"],
                ]
            )
        )

        print(
            accountsMerge(
                [
                    ["Gabe", "Gabe0@m.co", "Gabe3@m.co", "Gabe1@m.co"],
                    ["Kevin", "Kevin3@m.co", "Kevin5@m.co", "Kevin0@m.co"],
                    ["Ethan", "Ethan5@m.co", "Ethan4@m.co", "Ethan0@m.co"],
                    ["Hanzo", "Hanzo3@m.co", "Hanzo1@m.co", "Hanzo0@m.co"],
                    ["Fern", "Fern5@m.co", "Fern1@m.co", "Fern0@m.co"],
                ]
            )
        )
    }
}
