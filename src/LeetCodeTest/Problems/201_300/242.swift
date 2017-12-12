//
//  242.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 10/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_242: ProblemProtocol {
    func run() {
        print(isAnagram("anagram", "nagaram"));
        print(isAnagram("rat", "car"));
        print(isAnagram("a", "ab"));
    }

    func isAnagram(_ s: String, _ t: String) -> Bool {
        var counts = [Int](repeating: 0, count: 26);

        let offset = "a".utf8CString.first!;

        for ch in s {
            let idx = Int( String(ch).utf8CString.first! - offset );
            counts[idx] += 1;
        }

        for ch in t {
            let idx = Int( String(ch).utf8CString.first! - offset );
            counts[idx] -= 1;
        }

        return counts.filter { $0 != 0 }.count == 0;
    }
}
