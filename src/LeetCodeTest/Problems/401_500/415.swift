//
//  415.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 2019-07-27.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_415: ProblemProtocol {


    func addStrings(_ num1: String, _ num2: String) -> String {
        if num1.isEmpty { return num2 }
        if num2.isEmpty { return num1 }

        var result = ""
        var carry = false

        let N = max(num1.count, num2.count)
        for i in 0 ..< N {
            let ch1 = num1.count <= i ? "0" : num1[num1.count - i - 1]
            let ch2 = num2.count <= i ? "0" : num2[num2.count - i - 1]

//            print("\(ch1) + \(ch2)")

            let i1 = Int(String(ch1))!
            let i2 = Int(String(ch2))!
            let sum = i1 + i2 + (carry ? 1 : 0)

            result = "\(sum  % 10)" + result
            carry = sum / 10 > 0
        }

        return carry ? "1\(result)" : result
    }

    func run() {
        print(addStrings("1234", "456"))
        print(addStrings("0", "222"))
        print(addStrings("100", "456"))
        print(addStrings("1", "1"))
        print(addStrings("5", "5"))
    }
}

fileprivate extension String {

    subscript(i: Int) -> Character {
        let idx = self.index(self.startIndex, offsetBy: i)
        return self[idx]
    }

}
