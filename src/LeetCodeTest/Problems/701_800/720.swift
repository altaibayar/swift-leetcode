//
//  720.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 10/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_720: ProblemProtocol {
    func run() {
        print(longestWord(["a", "banana", "app", "appl", "ap", "apply", "apple"]));
    }

    func longestWord(_ words: [String]) -> String {
        let sorted = words.sorted();

        var set = Set<String>();
        var result = "";
        for word in sorted {
            if word.count == 1 || set.contains(String(word.dropLast())) {
                set.insert(word);
                if word.count > result.count {
                    result = word;
                }
            }
        }

        return result;
    }
}
