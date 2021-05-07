//
//  68.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 2021-05-06.
//  Copyright © 2021 tsevealt. All rights reserved.
//

import Foundation

class Problem_68: ProblemProtocol {

    func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
        guard maxWidth > 0 else { return [] }

        var accumulation = [(wordsLength: Int, words: [String])]()

        // Create accumulation
        var currentLine = [String]()
        var currentLineLength = 0
        for word in words {
            if currentLineLength + max(0, currentLine.count - 1) + word.count >= maxWidth {
                accumulation.append((wordsLength: currentLineLength, words: currentLine))
                currentLine.removeAll()
                currentLineLength = 0
            }

            currentLine.append(word)
            currentLineLength += word.count
        }
        if !currentLine.isEmpty {
            accumulation.append((wordsLength: currentLineLength, words: currentLine))
        }

        return accumulation.enumerated().map { (i, line) in
            if line.words.count == 1 || i == accumulation.count - 1 {
                return line.words.joined(separator: " ")

            } else {
                let div = maxWidth / line.wordsLength
                let mod = maxWidth % line.wordsLength

                

            }
        }
    }

    func run() {
        fullJustify(
            ["This", "is", "an", "example", "of", "text", "justification."], 16).forEach { print($0) }
        print("---")

        fullJustify(
            ["What","must","be","acknowledgment","shall","be"], 16).forEach { print($0) }
        print("---")

        fullJustify(
            ["Science","is","what","we",
             "understand","well","enough",
             "to","explain","to","a",
             "computer.",
             "Art","is","everything","else","we","do"], 20).forEach { print($0) }
    }
}
