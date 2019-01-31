//
//  168.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 2019-01-27.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_168: ProblemProtocol {
    func run() {
        print(convertToTitle(1))    //A
        print(convertToTitle(28))   //AB
        print(convertToTitle(701))  //ZY
    }

    func convertToTitle(_ n: Int) -> String {
        guard n >= 0 else { return "" }

        var n = n
        var result = ""
        let dict = buildDict()

        while n > 0 {
            let idx = (n - 1) % 26
            result = String(dict[idx]!) + result

            n = (n - 1) / 26
        }

        return result
    }

    func buildDict() -> [Int: Unicode.Scalar] {
        let A = Int(Unicode.Scalar.init("A")!.value)

        var result = [Int: Unicode.Scalar]()
        for i in 0 ..< 26 {
            result[i] = Unicode.Scalar(A + i)
        }

        return result
    }
}
