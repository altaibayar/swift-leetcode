//
//  380.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 2019-02-13.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_380: ProblemProtocol {
    func run() {
        // Init an empty set.
        let randomSet = RandomizedSet();

        // Inserts 1 to the set. Returns true as 1 was inserted successfully.
        print(randomSet.insert(1));

        // Returns false as 2 does not exist in the set.
        print(randomSet.remove(2));

        // Inserts 2 to the set, returns true. Set now contains [1,2].
        print(randomSet.insert(2));

        // getRandom should return either 1 or 2 randomly.
        print(randomSet.getRandom());

        // Removes 1 from the set, returns true. Set now contains [2].
        print(randomSet.remove(1));

        // 2 was already in the set, so return false.
        print(randomSet.insert(2));

        // Since 2 is the only number in the set, getRandom always return 2.
        print(randomSet.getRandom());

    }
}


class RandomizedSet {

    var set = Set<Int>()

    /** Initialize your data structure here. */
    init() {

    }

    /** Inserts a value to the set. Returns true if the set did not already contain the specified element. */
    func insert(_ val: Int) -> Bool {
        return set.insert(val).inserted
    }

    /** Removes a value from the set. Returns true if the set contained the specified element. */
    func remove(_ val: Int) -> Bool {
        return set.remove(val) != nil
    }

    /** Get a random element from the set. */
    func getRandom() -> Int {
        return set.randomElement()!
    }
}

/**
 * Your RandomizedSet object will be instantiated and called as such:
 * let obj = RandomizedSet()
 * let ret_1: Bool = obj.insert(val)
 * let ret_2: Bool = obj.remove(val)
 * let ret_3: Int = obj.getRandom()
 */

