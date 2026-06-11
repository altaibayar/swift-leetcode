//
//  638.swift
//  LeetCodeTest
//
//  Created by a on 11/06/2026.
//  Copyright © 2026 tsevealt. All rights reserved.
//

class Problem_638: ProblemProtocol {

    func shoppingOffers(_ price: [Int], _ special: [[Int]], _ needs: [Int]) -> Int {
        var j = 0
        var res = dot(needs, price)

        for s in special {
            var needsCopy = needs

            j = 0
            while j < needs.count {

                let diff = needsCopy[j] - s[j]
                if diff < 0 {
                    break
                }

                needsCopy[j] = diff

                j += 1
            }
            
            if j == needs.count {
                res = min (
                    res,
                    s[j] + shoppingOffers(price, special, needsCopy)
                )
            }
        }

        return res
    }

    func dot(_ aa: [Int], _ bb: [Int]) -> Int {
        var result = 0

        for (a, b) in zip(aa, bb) {
            result += (a * b)
        }

        return result
    }

    func run() {
        print(shoppingOffers([2, 5], [[3, 0, 5], [1, 2, 10]], [3, 2]))
        print(shoppingOffers([2, 3, 4], [[1, 1, 0, 4], [2, 2, 1, 9]], [1, 2, 1]))
    }

}
