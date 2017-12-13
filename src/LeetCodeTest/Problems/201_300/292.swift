//
//  292.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 13/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_292: ProblemProtocol {
    func run() {
        print(canWinNim(4));
        print(canWinNim(7));
    }

    func canWinNim(_ n: Int) -> Bool {
        return n % 4 != 0;
    }
}
