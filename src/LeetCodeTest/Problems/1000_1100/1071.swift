//
//  1071.swift
//  LeetCodeTest
//
//  Created by a on 11/06/2024.
//  Copyright © 2024 tsevealt. All rights reserved.
//

import Foundation

class Problem_1071: ProblemProtocol {
    
    func gcdOfStrings(_ str1: String, _ str2: String) -> String {
        guard str1 + str2 == str2 + str1 else { return "" }

        let gcd = gcd(str1.count, str2.count)
        return String(str1.prefix(gcd))
    }
    
    func gcd(_ x: Int, _ y: Int) -> Int {
        if y == 0 {
            return x;
        } else {
            return gcd(y, x % y);
        }
    }
    
    func run() {
        print(gcdOfStrings("ABCABC", "ABC"))
        print(gcdOfStrings("ABABAB", "ABAB"))
        print(gcdOfStrings("LEET", "CODE"))
    }
}
