//
//  937.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 2019-09-08.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_937: ProblemProtocol {

    func reorderLogFiles(_ logs: [String]) -> [String] {

        let isLetterLog: (String) -> (isLetter: Bool, id: String, cont: String) = { (log: String) in
            let idx = log.firstIndex(of: " ")!
            let idxInt = log.distance(from: log.startIndex, to: idx) + 1

            let it = log.index(log.startIndex, offsetBy: idxInt)
            if CharacterSet.decimalDigits.contains(log[it].unicodeScalars.first!) {
                return (false, "", "")
            } else {
                return (true, String(log.prefix(upTo: it)), String(log.suffix(from: it)))
            }
        }

//        print("-----")
//        logs
//            .map { "\($0): \(isLetterLog($0))" }
//            .forEach { print($0) }
//        print("-----")

        return logs.sorted(by: { (s1, s2) -> Bool in
            let letter1 = isLetterLog(s1)
            let letter2 = isLetterLog(s2)

            if letter1.isLetter && letter2.isLetter {
                if letter1.cont == letter2.cont {
                    return s1.compare(s2) == .orderedAscending
                } else {
                    return letter1.cont.compare(letter2.cont) == .orderedAscending
                }

            } else if letter1.isLetter {
                return true
            } else if letter2.isLetter {
                return false
            } else {
                return s1.compare(s2) == .orderedSame
            }
        })
    }

    func run() {
        print(reorderLogFiles(["dig1 8 1 5 1","let1 art can","dig2 3 6","let2 own kit dig","let3 art zero"]))
        print(reorderLogFiles(["dig1 8 1 5 1","let1 art can","dig2 3 6","let2 own kit dig","let3 art zero"]))
        print(reorderLogFiles(["1 n u", "r 527", "j 893", "6 14", "6 82"]))
        print(reorderLogFiles(["a1 9 2 3 1","g1 act car","zo4 4 7","ab1 off key dog","a8 act zoo","a2 act car"]))
        print(["a2 act car","g1 act car","a8 act zoo","ab1 off key dog","a1 9 2 3 1","zo4 4 7"])
    }
}
