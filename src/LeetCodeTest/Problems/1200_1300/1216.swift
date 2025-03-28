//
//  1216.swift
//  LeetCodeTest
//
//  Created by a on 24/03/2025.
//  Copyright © 2025 tsevealt. All rights reserved.
//

class Problem_1216: ProblemProtocol {
    func isPalindrome(memo: inout [[Int?]], chars: inout [Character], i: Int, j: Int) -> Int {
        if i == j {
            return 0
        }
        
        if i == j - 1 {
            return chars[i] != chars[j] ? 1 : 0
        }
        
        if let mem = memo[i][j] {
            return mem
        }
        
        if chars[i] == chars[j] {
            let mem = isPalindrome(memo: &memo, chars: &chars, i: i + 1, j: j - 1)
            memo[i][j] = mem
            return mem
        }
        
        let mem = 1 + min(
            isPalindrome(memo: &memo, chars: &chars, i: i + 1, j: j),
            isPalindrome(memo: &memo, chars: &chars, i: i, j: j - 1)
        )
        memo[i][j] = mem
        
        return mem
    }
    
    func isValidPalindrome(_ s: String, _ k: Int) -> Bool {
        var memo = [[Int?]](repeating: [Int?](repeating: nil, count: s.count), count: s.count)
        var chars = s.map { $0 }
        return isPalindrome(memo: &memo, chars: &chars, i: 0, j: s.count - 1) <= k
    }
    
    func run() {
        print(isValidPalindrome("abcdeca", 2))
        print(isValidPalindrome("abbababa", 1))
    }
}

