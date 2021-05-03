//
//  388.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 2021-05-03.
//  Copyright © 2021 tsevealt. All rights reserved.
//

import Foundation

class Problem_388: ProblemProtocol {

    func literal(_ input: String, from: inout Int) -> (tab: Int, name: String)? {
        var tab = 0, name = ""
        while from < input.count {
            let char = input.char(at: from)
            if char == "\n" {
                from += 1
                break
            } else if char == "\t" {
                tab += 1
            } else {
                name.append(char)
            }

            from += 1
        }

        if name.isEmpty {
            return nil
        }

        return (tab: tab, name: name)
    }

    func lengthLongestPath(_ input: String) -> Int {
        var result = 0

        let lines = input.split(separator: "\n").map { String($0) }
        var list = [Int](repeating: 0, count: lines.count)
        for line in lines {
            var level = 0
            while line.char(at: level) == "\t" { level += 1 }

            if list.count <= level {
                list.append(line.substring(from: level).count)
            } else {
                list[level] = line.substring(from: level).count
            }
            
            if line.contains(".") {
                let sum = list[0 ... level].reduce(0, +)
                result = max(result, sum + level)
            }
        }

        return result
    }

    func run() {
        print(lengthLongestPath("dir\n\tsubdir1\n\tsubdir2\n\t\tfile.ext"))
        print(lengthLongestPath("dir\n\tsubdir1\n\t\tfile1.ext\n\t\tsubsubdir1\n\tsubdir2\n\t\tsubsubdir2\n\t\t\tfile2.ext"))
        print(lengthLongestPath("a"))
        print(lengthLongestPath("file1.txt\nfile2.txt\nlongfile.txt"))
    }
}

extension String {
    func substring(from: Int) -> Substring {
        let startIndex = self.index(self.startIndex, offsetBy: from)
        return self[startIndex ..< self.endIndex]
    }

    func char(at index: Int) -> Character {
        let idx = self.index(self.startIndex, offsetBy: index)
        return self[idx]
    }
}
