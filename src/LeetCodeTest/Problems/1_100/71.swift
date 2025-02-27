//
//  71.swift
//  LeetCodeTest
//
//  Created by a on 27/02/2025.
//  Copyright © 2025 tsevealt. All rights reserved.
//

class Problem_71: ProblemProtocol {
    
    func simplifyPath(_ path: String) -> String {
        let SEPARATOR = "/"

        let folders = path
            .split(separator: SEPARATOR)
            .filter { !$0.isEmpty }
            .map { String($0) }
        
        var stack = [String]()
        for folder in folders {
            if folder == "." {
                // nothing
            } else if folder == ".." {
                let _ = stack.popLast()
            } else {
                stack.append(folder)
            }
        }

        return stack.isEmpty ? SEPARATOR : SEPARATOR + stack.joined(separator: SEPARATOR)
    }

    func run() {
        print(simplifyPath("/home"))
        print(simplifyPath("/home//foo/"))
        print(simplifyPath("/home/user/Documents/../Pictures"))
        print(simplifyPath("/../"))
        print(simplifyPath("/.../a/../b/c/../d/./"))
    }
}
