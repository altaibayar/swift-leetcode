//
//  8.swift
//  LeetCodeTest
//
//  Created by a on 28/02/2025.
//  Copyright © 2025 tsevealt. All rights reserved.
//

class Problem_8: ProblemProtocol {

    func myAtoi(_ s: String) -> Int {
        guard !s.isEmpty else { return 0}
        
        let zeroAscii: UInt8 = 48
        
        var result: Int64 = 0
        var isNegative = false
        
        var s = s
        while s.hasPrefix(" ") { s.removeFirst() }
        
        for (i, ch) in s.enumerated() {
            if ch == "-" && i == 0 {
                isNegative = true
            } else if ch == "+" && i == 0 {
                // do nothing
            } else if ch.isNumber {
                result = (result * 10) + Int64(ch.asciiValue! - zeroAscii)
            } else {
                break
            }
            
            if isNegative {
                let tmp = result * -1
                
                if tmp < Int32.min {
                    return Int(Int32.min)
                }
            } else if result > Int32.max {
                return Int(Int32.max)
            }
        }
        
        return Int( isNegative ? result * -1 : result )
    }
    
    func run() {
        print(myAtoi("+1")) // -2147483648
        print(myAtoi("-91283472332")) // -2147483648
        print(myAtoi("42"))
        print(myAtoi("-042"))
        print(myAtoi("    -042"))
        print(myAtoi("    -042    "))
        print(myAtoi("1337c0d3"))
        print(myAtoi("0"))
        print(myAtoi("words and 987"))
    }
}
