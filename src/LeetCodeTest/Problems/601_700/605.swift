//
//  605.swift
//  LeetCodeTest
//
//  Created by a on 11/06/2024.
//  Copyright © 2024 tsevealt. All rights reserved.
//

import Foundation

class Problem_605: ProblemProtocol {
    
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        var result = 0
        
        var flowers = flowerbed
        for i in 0 ..< flowers.count {
            let leftEmpty = i == 0 ? true : flowers[i - 1] == 0
            let rightEmpty = i == flowers.count - 1 ? true : flowers[i + 1] == 0
            let centerEmpty = flowers[i] == 0
            
            if leftEmpty && rightEmpty && centerEmpty {
                flowers[i] = 1
                result += 1
            }
        }
        
        return result >= n
    }
    
    func run() {
        print(canPlaceFlowers([1,0,0,0,1], 1))
        print(canPlaceFlowers([1,0,0,0,1], 2))
        print(canPlaceFlowers([1,0,0,0,0,1], 2))
        print(canPlaceFlowers([1,0,0,0,1,0,0], 2))
    }
}
