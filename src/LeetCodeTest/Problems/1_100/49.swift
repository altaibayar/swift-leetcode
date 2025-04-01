//
//  49.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 30/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

class Problem_49: ProblemProtocol {
    func run() {
        print(groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"]));
    }
    
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        let thumbprint: (String) -> String = { str in
            var count = [Int](repeating: 0, count: 26)
            
            for ch in str {
                count[Int(ch.asciiValue! - Character("a").asciiValue!)] += 1
            }
            
            return count.map { String($0) }.joined(separator: "_")
        }
        
        var result = [String: [String]]()
        
        for s in strs {
            result[thumbprint(s), default: []].append(s)
        }
        
        return result.values.map { $0 }
    }
    
    func _groupAnagrams(_ strs: [String]) -> [[String]] {
        var result = [String: [String]]();

        let key: (String) -> (String) = { str in
            var ar = Array(repeating: 0, count: 26);

            for ch in str {
                let i = Int(ch.unicodeScalars.first!.value) - Int("a".unicodeScalars.first!.value)
                ar[i] += 1;
            }

            return ar.map { "\($0)" }.joined(separator: "_");
        }

        for str in strs {
            let k = key(str);

            if result[k] == nil {
                result[k] = [ str ];
            } else {
                result[k]!.append(str);
            }
        }

        return Array(result.values);
    }
}

