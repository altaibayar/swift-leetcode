//
//  200.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 2019-07-27.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_200: ProblemProtocol {

    func floodFill(i: Int, j: Int, array: inout [[Character]]) {
        var stack = [(Int, Int)]()
        stack.append((i, j))

        let offsets: [(Int, Int)] = [
            (0, -1),
            (1, 0),
            (0, 1),
            (-1, 0) ]

        while !stack.isEmpty {
            let (i, j) = stack.popLast()!
            array[i][j] = "0"

            for offset in offsets {
                let newI = i + offset.0
                let newJ = j + offset.1

                if newI >= 0, newJ >= 0, newI < array.count, newJ < array[i].count, array[newI][newJ] == "1" {
                    stack.append((newI, newJ))
                }
            }
        }
    }

    func numIslands(_ grid: [[Character]]) -> Int {
        var copy = grid

        var result = 0
        for i in  0 ..< copy.count {
            let N = copy[i].count

            for j in 0 ..< N {
                let arr = copy[i]
                let ch = arr[j]

                if ch == "1" {
                    floodFill(i: i, j: j, array: &copy)
                    result += 1
                }
            }
        }

        return result
    }

    func run() {
        print(numIslands([
            "11110".map { $0 },
            "11010".map { $0 },
            "11000".map { $0 },
            "00000".map { $0 }
            ]))

        print(numIslands([
            "11000".map { $0 },
            "11000".map { $0 },
            "00100".map { $0 },
            "00011".map { $0 }
            ]))
    }
}
