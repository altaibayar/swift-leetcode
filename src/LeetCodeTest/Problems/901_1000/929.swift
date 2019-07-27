//
//  929.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 2019-07-27.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_929: ProblemProtocol {

    func numUniqueEmails(_ emails: [String]) -> Int {
        var set = Set<String>()

        for email in emails {

            var localName = true
            var ignoreAfterPlus = false

            var acc = ""
            for ch in email {

                if ch == "@" {
                    localName = false
                    acc.append(ch)

                } else if !localName {
                    acc.append(ch)

                } else {

                    if ignoreAfterPlus {
                        continue
                    }

                    //localName
                    if ch == "+" {
                        ignoreAfterPlus = true
                    } else if ch != "." {
                        acc.append(ch)
                    }
                }
            }

            set.insert(acc)
        }

        return set.count
    }

    func run() {
        print(numUniqueEmails([
            "test.email+alex@leetcode.com",
            "test.e.mail+bob.cathy@leetcode.com",
            "testemail+david@lee.tcode.com"
            ]))
    }
}
