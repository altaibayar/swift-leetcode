//
//  54.swift
//  LeetCodeTest
//
//  Created by a on 14/03/2025.
//  Copyright © 2025 tsevealt. All rights reserved.
//

class Problem_54: ProblemProtocol {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var result = [Int]()
        
        let row = matrix.count, column = matrix[0].count
        var left = 0, top = 0, right = column - 1, bottom = row - 1
        
        while row * column > result.count {
            // R
            for x in left ... right {
                result.append(matrix[top][x])
            }
            
            // D
            if top + 1 <= bottom {
                for y in top + 1 ... bottom {
                    result.append(matrix[y][right])
                }
            }
                
            // L
            if top < bottom {
                for x in stride(from: right - 1, through: left, by: -1) {
                    result.append(matrix[bottom][x])
                }
            }
            
            // U
            if left < right {
                for y in stride(from: bottom - 1, to: top, by: -1) {
                    result.append(matrix[y][left])
                }
            }
            
            bottom -= 1
            top += 1
            left += 1
            right -= 1
        }

        return result
    }
    
    func _spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var result = [Int]()

        let rows = matrix.count, columns = matrix[0].count
        var up = 0, down = rows - 1, left = 0, right = columns - 1
        
        
        while result.count < rows * columns {
            
            // R
            for col in left ... right {
                result.append(matrix[up][col])
            }
            
            // D
            if up + 1 <= down {
                for row in (up + 1) ... down {
                    result.append(matrix[row][right])
                }
            }
            
            // L
            if up != down {
                for col in stride(from: right - 1, through: left, by: -1) {
                    result.append(matrix[down][col])
                }
            }
            
            // U
            if left != right {
                for row in stride(from: down - 1, to: up, by: -1) {
                    result.append(matrix[row][left])
                }
            }
            
            up += 1
            down -= 1
            left += 1
            right -= 1
        }

        return result
    }
    
    func run() {
        print(spiralOrder([[1,2,3],[4,5,6],[7,8,9]]))
        print(spiralOrder([[1,2,3,4],[5,6,7,8],[9,10,11,12]]))
    }
}
