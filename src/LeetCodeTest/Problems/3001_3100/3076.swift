//
//  3076.swift
//  LeetCodeTest
//
//  Created by a on 11/06/2026.
//  Copyright © 2026 tsevealt. All rights reserved.
//

class Problem_3076: ProblemProtocol {
    func shortestSubstrings(_ arr: [String]) -> [String] {
        guard !arr.isEmpty else { return [] }

        var allSubstrings = [Int: Set<String>]()
        var substringCounts = [String: Int]()

        for (arrIdx, substring) in arr.enumerated() {
            if substring.isEmpty {
                allSubstrings[arrIdx] = Set<String>()
                continue
            }

            for i in 0..<substring.count {
                for j in i + 1...substring.count {
                    let startIdx = substring.index(substring.startIndex, offsetBy: i)
                    let endIdx = substring.index(substring.startIndex, offsetBy: j)
                    let sub = substring[startIdx..<endIdx]

                    allSubstrings[arrIdx, default: Set<String>()].insert(String(sub))
                }
            }

            for str in allSubstrings[arrIdx] ?? [] {
                substringCounts[str, default: 0] += 1
            }
        }

        var result = [String](repeating: "", count: arr.count)

        for (arrIdx, _) in arr.enumerated() {

            var tmp = Set<String>()

            let slices = allSubstrings[arrIdx] ?? []
            for slice in slices {
                if let count = substringCounts[slice], count == 1 {
                    tmp.insert(slice)
                }
            }

            if let first = tmp.sorted().first {
                result[arrIdx] = first
            }
        }

        return result
    }

    func run() {
        print(shortestSubstrings(["a", "b"]))

        print(shortestSubstrings(["cab", "ad", "bad", "c"]))
        print(shortestSubstrings(["abc", "bcd", "abcd"]))
        print(shortestSubstrings(["gfnt", "xn", "mdz", "yfmr", "fi", "wwncn", "hkdy"]))
    }
}
