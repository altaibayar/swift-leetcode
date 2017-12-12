//
//  401.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 09/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_401: ProblemProtocol {
    func run() {
        print(readBinaryWatch(3));
    }

    func readBinaryWatch(_ num: Int) -> [String] {
        print("----");
        variation([Bool](repeating: false, count: num), 2, 0);
        print("----");

        return [""];
    }

    func variation(_ state: [Bool], _ num: Int, _ idx: Int) {
        let count = state.filter { $0 }.count;
        if count == num {
            print(state);
        } else if idx == state.count {
            return;
        } else {
            for i in idx ..< state.count {
                var copy = state;
                if copy[i] == false {
                    copy[i] = true;
                    variation(copy, num, i);
                }
            }
        }
    }
}
