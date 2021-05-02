//
//  811.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 2021-05-02.
//  Copyright © 2021 tsevealt. All rights reserved.
//

import Foundation

class Problem_811: ProblemProtocol {
    func subdomainVisits(_ cpdomains: [String]) -> [String] {
        let parseDomain: (String) -> (Int, [String]) = { domain in
            let splt = domain.split(separator: " ").map { String($0) }
            let count = Int(splt[0])!
            let domainParts = splt[1].split(separator: ".").map { String($0) }

            var result = [String]()
            for i in stride(from: domainParts.count - 1, through: 0, by: -1) {
                result.append(domainParts[i ..< domainParts.count].joined(separator: "."))
            }

            return (count, result)
        }

        var map: [String: Int] = [:]

        for domain in cpdomains {
            let parsed =  parseDomain(domain)

            for part in parsed.1 {
                if let count = map[part] {
                    map[part] = count + parsed.0
                } else {
                    map[part] = parsed.0
                }
            }
        }

        return map.map { kvp in
            return "\(kvp.value) \(kvp.key)"
        }
    }

    func run() {
        print(subdomainVisits(["9001 discuss.leetcode.com"]))
        print(subdomainVisits(["900 google.mail.com", "50 yahoo.com", "1 intel.mail.com", "5 wiki.org"]))
    }
}
