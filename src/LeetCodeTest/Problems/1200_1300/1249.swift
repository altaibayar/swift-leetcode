//
//  1249.swift
//  LeetCodeTest
//
//  Created by a on 18/02/2025.
//  Copyright © 2025 tsevealt. All rights reserved.
//

class Problem_1249: ProblemProtocol {
    func minRemoveToMakeValid(_ s: String) -> String {
        var openCount = 0
        var arr: [Character] = s.map { $0 }
        
        for (i, ch) in arr.enumerated() {
            if ch == "(" {
                openCount += 1
            } else if ch == ")" {
                if openCount == 0 {
                    arr[i] = "*"
                } else {
                    openCount -= 1
                }
            }
        }
        
        for i in stride(from: arr.count - 1, through: 0, by: -1) {
            if openCount > 0 && arr[i] == "(" {
                arr[i] = "*"
                openCount -= 1
            }
        }
        
        return String(arr.filter { $0 != "*" })
    }
    
    func run() {
        print(minRemoveToMakeValid("lee(t(c)o)de)"))
        print(minRemoveToMakeValid("a)b(c)d"))
        print(minRemoveToMakeValid("))(("))
    }
}
