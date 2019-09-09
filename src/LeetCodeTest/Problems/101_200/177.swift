//
//  177.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 2019-09-08.
//  Copyright © 2019 tsevealt. All rights reserved.
//

import Foundation

/*
CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
RETURN (
    /* Write your T-SQL query statement below. */
    SELECT DISTINCT e.Salary
    FROM Employee as e
    ORDER BY e.Salary DESC
    OFFSET @N - 1 ROWS
    FETCH NEXT 1 ROWS ONLY
);
END
*/
