//
//  151.swift
//  LeetCodeTest
//
//  Created by a on 11/06/2024.
//  Copyright © 2024 tsevealt. All rights reserved.
//

import Foundation

class Problem_151: ProblemProtocol {
 
    func reverseWords(_ s: String) -> String {        
        return s.split(separator: " ").reversed().joined(separator: " ")
        // return s.split(separator: /\s+/).reversed().joined(separator: " ")
    }

    func run() {
        print(reverseWords("the sky is blue"))
        print(reverseWords("  hello world  "))
        print(reverseWords("a good   example"))
    }
}
