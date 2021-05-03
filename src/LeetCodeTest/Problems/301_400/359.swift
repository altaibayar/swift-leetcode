//
//  359.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 2021-05-02.
//  Copyright © 2021 tsevealt. All rights reserved.
//

import Foundation

class Problem_359: ProblemProtocol {
    class Logger {
        let N = 10

        var queue: [(Int, String)] = []
        var msgSet = Set<String>()

        /** Initialize your data structure here. */
        init() {

        }

        /** Returns true if the message should be printed in the given timestamp, otherwise returns false.
         If this method returns false, the message will not be printed.
         The timestamp is in seconds granularity. */
        func shouldPrintMessage(_ timestamp: Int, _ message: String) -> Bool {
            while let first = queue.first {
                if timestamp - first.0 >= N {
                    queue.removeFirst()
                    msgSet.remove(first.1)
                } else {
                    break
                }
            }

            if !msgSet.contains(message) {
                queue.append((timestamp, message))
                msgSet.insert(message)

                return true
            } else {
                return false
            }
        }
    }

    func run() {
        let logger = Logger()

        let data: [[Any]] = [[1, "foo"], [2, "bar"], [3, "foo"], [8, "bar"], [10, "foo"], [11, "foo"]];
        for d in data {
            print(logger.shouldPrintMessage(d[0] as! Int, d[1] as! String))
        }
    }
}
