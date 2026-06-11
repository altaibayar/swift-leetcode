//
//  638.swift
//  LeetCodeTest
//
//  Created by a on 11/06/2026.
//  Copyright © 2026 tsevealt. All rights reserved.
//

class Problem_638: ProblemProtocol {

    func shoppingOffers(_ price: [Int], _ special: [[Int]], _ needs: [Int]) -> Int {
        var cache = [String: Int]()

        func dfs(_ currentNeeds: [Int]) -> Int {
            let key = currentNeeds.map { String($0) }.joined(separator: ",")
            if let result = cache[key] {
                return result
            }

            if currentNeeds.allSatisfy({ $0 == 0 }) {
                return 0
            }

            var cost = zip(currentNeeds, price).reduce(0) { $0 + ($1.0 * $1.1) }

            let applyFirstApplicableOffer: ([Int]) -> [Int]? = { offer in
                var newNeeds = currentNeeds

                for i in 0..<price.count {
                    if newNeeds[i] < offer[i] {
                        return nil
                    }

                    newNeeds[i] -= offer[i]
                }

                return newNeeds
            }

            for offer in special {
                if let newNeeds = applyFirstApplicableOffer(offer) {
                    cost = min(cost, offer.last! + dfs(newNeeds))
                }
            }

            cache[key] = cost
            return cost
        }

        return dfs(needs)
    }

    func run() {
        print(shoppingOffers([2, 5], [[3, 0, 5], [1, 2, 10]], [3, 2]))
        print(shoppingOffers([2, 3, 4], [[1, 1, 0, 4], [2, 2, 1, 9]], [1, 2, 1]))

        print(
            shoppingOffers(
                [2, 2],
                [
                    [1, 1, 1], [1, 1, 2], [1, 1, 3], [1, 1, 4], [1, 1, 5], [1, 1, 6], [1, 1, 7],
                    [1, 1, 8], [1, 1, 9], [1, 1, 10], [1, 1, 11], [1, 1, 12], [1, 1, 13],
                    [1, 1, 14], [1, 1, 15],
                ],
                [10, 10]
            )
        )
    }

}
