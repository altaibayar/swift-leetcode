//
//  695.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 2021-05-06.
//  Copyright © 2021 tsevealt. All rights reserved.
//

import Foundation

class Problem_695: ProblemProtocol {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        guard !grid.isEmpty, !grid[0].isEmpty else {
            return 0
        }

        let N = grid.count
        let M = grid[0].count
        let direction: [(x: Int, y: Int)] = [
            (x: -1, y: 0),
            (x: +1, y: 0),
            (x: 0, y: -1),
            (x: 0, y: +1)
        ]

        var result = 0

        var visited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: M), count: N)
        for i in stride(from: 0, to: N, by: +1)  {
            for j in stride(from: 0, to: M, by: +1) {

                if visited[i][j] { continue }
                visited[i][j] = true

                if grid[i][j] == 0 { continue }

                var currentSize = 1
                var stack: [(x: Int, y: Int)] = [(x: i, y: j)]

                while !stack.isEmpty {
                    let current = stack.removeFirst()

                    if grid[current.x][current.y] == 0 { continue }

                    for dir in direction {
                        let newPosX = current.x + dir.x
                        let newPosY = current.y + dir.y

                        if newPosX < 0 || newPosX >= N || newPosY < 0 || newPosY >= M {
                            continue
                        }

                        if !visited[newPosX][newPosY] && grid[newPosX][newPosY] == 1 {
                            currentSize += 1
                            stack.append((x: newPosX, newPosY))
                        }

                        visited[newPosX][newPosY] = true
                    }
                }

                result = max(result, currentSize)
            }
        }

        return result
    }

    func run() {
        print(maxAreaOfIsland(
                [
                    [0,0,1,0,0,0,0,1,0,0,0,0,0],
                    [0,0,0,0,0,0,0,1,1,1,0,0,0],
                    [0,1,1,0,1,0,0,0,0,0,0,0,0],
                    [0,1,0,0,1,1,0,0,1,0,1,0,0],
                    [0,1,0,0,1,1,0,0,1,1,1,0,0],
                    [0,0,0,0,0,0,0,0,0,0,1,0,0],
                    [0,0,0,0,0,0,0,1,1,1,0,0,0],
                    [0,0,0,0,0,0,0,1,1,0,0,0,0]
                ]))
    }
}
