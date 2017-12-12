//
//  67.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 09/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_67: ProblemProtocol {

    func run() {
        print(addBinary("100", "111"));
    }

    func addBinary(_ a: String, _ b: String) -> String {

        let adder: (String.Element, String.Element, String.Element) -> (String.Element, Bool) = { ch1, ch2, ch3 in
            var oneCount = 0;
            if ch1 == "1" { oneCount += 1; }
            if ch2 == "1" { oneCount += 1; }
            if ch3 == "1" { oneCount += 1; }

            return (oneCount % 2 == 0 ? "0" : "1", oneCount >= 2);
        }

        var s1 = a;
        var s2 = b;

        var result = "";
        var toAdd = false;

        while s1.count > 0 || s2.count > 0 {
            let ch1 = s1.last ?? "0";
            let ch2 = s2.last ?? "0";

            let sum: String.Element;
            (sum, toAdd) = adder(ch1, ch2, toAdd ? "1" : "0");

            result.insert(sum, at: result.startIndex);

            s1 = s1.count == 0 ? "" : String(s1.dropLast());
            s2 = s2.count == 0 ? "" : String(s2.dropLast());
        }

        if toAdd {
            result.insert("1", at: result.startIndex);
        }

        return result.count == 0 ? "0" : result;
    }
}
