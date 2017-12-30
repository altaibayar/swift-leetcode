//
//  36.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 30/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_36: ProblemProtocol {
    func run() {


    }

    func isValidSudoku(_ board: [[Character]]) -> Bool {

        var used1: [[Bool]] = createArray();
        var used2: [[Bool]] = createArray();
        var used3: [[Bool]] = createArray();

        for i in 0 ..< 9 {
            for j in 0 ..< 9 {
                if board[i][j] == "." {
                    continue;
                }

                let num = Int(board[i][j].unicodeScalars.first!.value) - Int("0".unicodeScalars.first!.value) - 1;
                let k = (i / 3) * 3 + j / 3;

                if used1[i][num] || used2[j][num] || used3[k][num] {
                    return false;
                }

                used1[i][num] = true;
                used2[j][num] = true;
                used3[k][num] = true;
            }
        }

        return true;
    }

    func createArray() ->  [[Bool]] {
        var result = [[Bool]]();

        for _ in 0 ..< 9 {
            result.append(Array(repeating: false, count: 9));
        }

        return result;
    }
}
