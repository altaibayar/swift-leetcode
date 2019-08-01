//
//  289.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 2019-08-01.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_289: ProblemProtocol {

    func gameOfLife(_ board: inout [[Int]]) {

        let liveNeighbours: ([[Int]], Int, Int) -> Int = { board, i, j in

            var result = 0
            for ii in i - 1 ... i + 1 where ii >= 0 && ii < board.count {
                for jj in j - 1 ... j + 1 where jj >= 0 && jj < board[ii].count {
                    if ii == i && jj == j { continue }
                    if board[ii][jj] == 1 || board[ii][jj] == -1 { result += 1 }
                }
            }

            return result
        }

        for (i, row) in board.enumerated() {
            for (j, b) in row.enumerated() {
                let neigh = liveNeighbours(board, i, j)

                if b == 1 && (neigh < 2 || neigh > 3) {
                    board[i][j] = -1
                }

                if b == 0 && neigh == 3 {
                    board[i][j] = 2
                }
            }
        }

        for i in 0 ..< board.count {
            for j in 0 ..< board[i].count {
                board[i][j] = board[i][j] > 0 ? 1 : 0
            }
        }
    }

    func run() {

        var board: [[Int]] = [
            [0,1,0],
            [0,0,1],
            [1,1,1],
            [0,0,0]
        ]

        gameOfLife(&board)
        board.forEach { print($0) }
    }
}
