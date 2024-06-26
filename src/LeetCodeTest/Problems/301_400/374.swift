//
//  374.swift
//  LeetCodeTest
//
//  Created by a on 26/06/2024.
//  Copyright © 2024 tsevealt. All rights reserved.
//

import Foundation

class Problem_374: ProblemProtocol {
    
    func guessNumber(_ n: Int) -> Int {
        return gn(1, n)
    }
    
    private func gn(_ l: Int, _ r: Int) -> Int {
        let m  = (l + r) / 2
        
        switch guess(m) {
            case 0: return m
            case 1: return gn(m + 1, r)
            case -1: return gn(l, m - 1)
            default:
                return 0
        }
    }
    
    func guess(_ m: Int) -> Int { 0 }
    
    func run() {
        
    }
}
