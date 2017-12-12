//
//  9.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 09/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_9: ProblemProtocol {

    func run() {
        print(isPalindrome(0));
        print(isPalindrome(1));
        print(isPalindrome(121));
        print(isPalindrome(1234321));
        print(isPalindrome(121111));
        print(isPalindrome(1212341));
    }

    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 || (x > 0 && x % 10 == 0) { return false; }

        var tmp = x;

        var reverse = 0;
        while tmp > reverse {
            let m = tmp % 10;
            reverse *= 10;
            reverse += m;

            tmp /= 10;
        }

        return tmp == reverse || tmp == reverse / 10;
    }
}
