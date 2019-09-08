//
//  175.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 2019-09-08.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

class Problem_175: ProblemProtocol {

    /*
     /* Write your T-SQL query statement below */

     SELECT p.FirstName, p.LastName, a.City, a.State
         FROM Person p
         LEFT OUTER JOIN Address a ON a.PersonId = p.PersonId
     */

    func run() {

    }
}
