//
//  125.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 2019-01-27.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_125: ProblemProtocol {

    func run() {
        print(isPalindrome("A man, a plan, a canal: Panama"))
        print(isPalindrome("race a car"))
        print(isPalindrome("0P"))
        print(isPalindrome("a"))
        print(isPalindrome("?"))
        print(isPalindrome(""))
    }

    func isPalindrome(_ s: String) -> Bool {
        //A - 65
        //a - 97
        let A = s.unicodeScalars
            .filter { CharacterSet.alphanumerics.contains($0) }
            .map { return $0.value < 97 ? Unicode.Scalar.init($0.value + (97 - 65)) : $0 }

        guard false == A.isEmpty else {
            return true
        }

        for i in 0 ... A.count / 2 {
            let a1 = A[i]
            let a2 = A[A.count - 1 - i]

            if a1 != a2 { return false }
        }

        return true
    }
}
