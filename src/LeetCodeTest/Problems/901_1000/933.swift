//
//  933.swift
//  LeetCodeTest
//
//  Created by a on 12/06/2024.
//  Copyright © 2024 tsevealt. All rights reserved.
//

import Foundation

class Problem_933: ProblemProtocol {
 
    class RecentCounter {
        let timeout = 3000
        var queue: [Int] = []
        
        init() {
            
        }
        
        func ping(_ t: Int) -> Int {
            while let first = queue.first {
                if first + timeout < t {
                    queue.removeFirst()
                } else {
                    break
                }
            }

            queue.append(t)
            return queue.count
        }
    }
    
    func run() {
        let recentCounter = RecentCounter();
        print(recentCounter.ping(1));     // requests = [1], range is [-2999,1], return 1
        print(recentCounter.ping(100));   // requests = [1, 100], range is [-2900,100], return 2
        print(recentCounter.ping(3001));  // requests = [1, 100, 3001], range is [1,3001], return 3
        print(recentCounter.ping(3002));  // requests = [1, 100, 3001, 3002], range is [2,3002], return 3
    }
}
