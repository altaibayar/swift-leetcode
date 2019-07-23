//
//  438.swift
//  LeetCodeTest
//
//  Created by Altai Tseveenbayar on 2019-07-17.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_438: ProblemProtocol {
    
    func makeMap(str: String) -> [Int] {
        var result = [Int](repeating: 0, count: 26)
        for ch in str {
            result[ch.index] += 1
        }
        
        return result
    }
    
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        guard p.count <= s.count, !s.isEmpty, !p.isEmpty else {
            return [ ]
        }

        var result = [Int]()
        var map = makeMap(str: p)
        
        var missing = p.count
        var j = 0
        
        for (i, ch) in s.enumerated() {
            let idx: Int = ch.index
            if map[idx] > 0 {
                missing -= 1
            }
            
            map[idx] -= 1
            
            while missing == 0 {
                if i - j + 1 == p.count {
                    result.append(j)
                }
                
                let sj = s[s.index(s.startIndex, offsetBy: j)]
                map[sj.index] += 1
                if map[sj.index] > 0 {
                    missing += 1
                }
                
                j += 1
            }
        }
        
        return result
    }

    /*
     public List<Integer> findAnagrams(String s, String p) {
     
        char[] sc = s.toCharArray();
        char[] pc = p.toCharArray();
        int[] map = new int[26];
        List<Integer> ans = new ArrayList<>();
        int len = pc.length;
        for(char c:pc)
            map[c-'a']++;
    
        int j = 0;
        int missing=pc.length;
    
        for(int i =0;i<sc.length;i++){
            char c = sc[i];
            if(map[c-'a']>0)
                missing--;
    
            map[c-'a']--;
    
            while(missing==0){
                if(i-j+1==len)
                    ans.add(j);
    
                if(++map[sc[j]-'a']>0)
                    missing++;
    
                j++;
            }
        }
     
        return ans;
     }
     */
    
    func run() {
        print(findAnagrams("", ""))
        print(findAnagrams("", "ab"))
        print(findAnagrams("cbaebabacd", "abc"))
        print(findAnagrams("abab", "ab"))
    }
}

private extension Character {
    var index: Int {
        return Int(self.asciiValue! - "a".first!.asciiValue!)
    }
}
