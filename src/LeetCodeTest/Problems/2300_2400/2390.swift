//
//  2390.swift
//  LeetCodeTest
//
//  Created by a on 12/06/2024.
//  Copyright © 2024 tsevealt. All rights reserved.
//

import Foundation

class Problem_2390: ProblemProtocol {
 
    func removeStars(_ s: String) -> String {
        var stack = [Character]()
        
        for ch in s {
            if ch == "*" && !stack.isEmpty {
                stack.removeLast()
            } else {
                stack.append(ch)
            }
        }
        
        return String(stack)
    }
    
    func run() {
        print(removeStars("leet**cod*e"))
        print(removeStars("erase*****"))
    }
}
