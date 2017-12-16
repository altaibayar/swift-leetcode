//
//  Interval.swift
//  LeetCodeTest
//
//  Created by altaibayar tseveenbayar on 16/12/2017.
//  Copyright © 2017 tsevealt. All rights reserved.
//

import Foundation

public class Interval {
  public var start: Int
  public var end: Int
  public init(_ start: Int, _ end: Int) {
    self.start = start
    self.end = end
  }
}

extension Interval: CustomStringConvertible {

    public var description: String {
        return "[\(self.start), \(self.end)]";
    }

    class func create(_ arrays: [[Int]]) -> [Interval] {
        var result = [Interval]();
        for array in arrays {
            result.append(Interval.create(array));
        }

        return result;
    }

    class func create(_ array: [Int]) -> Interval {
        return Interval(array[0], array[1]);
    }
}
