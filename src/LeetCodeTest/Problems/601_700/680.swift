//
//  680.swift
//  LeetCodeTest
//
//  Created by a on 03/03/2025.
//  Copyright © 2025 tsevealt. All rights reserved.
//

class Problem_680: ProblemProtocol {
    
    private func isPalindrom(_ s: [Character], i: Int, j: Int) -> Bool {
        var i = i, j = j
        while i < j {
            if s[i] != s[j] {
                return false
            }
            
            i += 1
            j -= 1
        }
        
        return true
    }
    
    func validPalindrome(_ s: String) -> Bool {
        var chars: [Character] = Array(s)
        
        var i = 0
        var j = s.count - 1
        
        while i < j {
            if chars[i] != chars[j] {
                return isPalindrom(chars, i: i + 1, j: j) || isPalindrom(chars, i: i, j: j - 1)
            }
            
            i += 1
            j -= 1
        }

        return true
    }

    func run() {
        print(validPalindrome("aba"))
        print(validPalindrome("abca"))
        print(validPalindrome("abc"))
        print(validPalindrome("klsaantowecjcflbenbvqbpcwqwdjqkoabnggutmufdoanehqjpuilhhkpwyoqfrirjnjaxfkhhvzcrfvttmplcmmaozoxtwyuiqfxciflbngmjrfrsvbjexknigqpydmirqwkajorlxmcrbpjpjsnqydekxzczshliuilwacdwvpgpurusvjxhjaesjrigrurkjmahpvvmmgindehhenslzdcjipydoiiiqhrrtlzfeajxwedhsjdsxsdzxcuxedluwulntgmqxknzoiwbgdyiofabdlceflnegqfuiogcfyptzbewwxohfefgrljvmeaottxsegrpvpugjxtzgpnqvlcnfvytwdhoulxoetbmxxvmsbuqnmvciovrsjvynfbgtkvzqiiawwnvjimwjwutotlqnnosgyugefihlvgktlgyhfwngpkvkrqxmbhlhoekvquajdhietjzphinpnahbbzyjrtprevbxgvesphvvokzjrxkdjksdjgfocyiulkvqxlnqdutehneuwfufiotgizpqnca"))
    }
}
