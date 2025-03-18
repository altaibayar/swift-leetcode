//
//  227.swift
//  LeetCodeTest
//
//  Created by a on 18/03/2025.
//  Copyright © 2025 tsevealt. All rights reserved.
//

class Problem_227: ProblemProtocol {

    
    func calculate(_ s: String) -> Int {
        var num = 0
        var stack = [Int]()
        var op = "+"

        for ch in s + "+" where ch != " " {
            
            if let number = ch.wholeNumberValue {
                num = num * 10 + number
            } else {
                switch op {
                case "+": stack.append(num)
                case "-": stack.append(-num)
                case "*": stack.append(stack.removeLast() * num)
                case "/": stack.append(stack.removeLast() / num)
                default: fatalError()
                }
                
                num = 0
                op = String(ch)
            }
            
        }
        
        return stack.reduce(0, +)
    }

    func run() {
        print(calculate("-5-2"))
//        print(calculate("3+2*2"))
//        print(calculate(" 3/2 "))
//        print(calculate(" 3+5 / 2 "))
    }
}
