//
//  2409.swift
//  LeetCodeTest
//
//  Created by Altaibayar Tseveenbayar on 24/10/2026.
//  Copyright © 2026 tsevealt. All rights reserved.
//

class Problem_2409: ProblemProtocol {

    func countDaysTogether(
        _ arriveAlice: String,
        _ leaveAlice: String,
        _ arriveBob: String,
        _ leaveBob: String
    ) -> Int {

        typealias Date = (month: Int, day: Int)

        let parse: (String) -> (Date) = { str in
            let splt = str.split(separator: "-")

            return (
                month: Int(splt[0])!,
                day: Int(splt[1])!
            )
        }

        let smallerOrEqual: (Date, Date) -> Bool = { d1, d2 in
            if d1.month < d2.month {
                return true
            } else if d1.month == d2.month && d1.day <= d2.day {
                return true
            }

            return false
        }

        let contains: (Date, Date, Date) -> Bool = { d, from, to in
            if from.month > d.month {
                return false
            } else if from.month == d.month && from.day > d.day {
                return false
            }

            if to.month < d.month {
                return false
            } else if to.month == d.month && to.day < d.day {
                return false
            }

            return true
        }

        let numberOfDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
        let arriveAlice = parse(arriveAlice)
        let leaveAlice = parse(leaveAlice)
        let arriveBob = parse(arriveBob)
        let leaveBob = parse(leaveBob)

        let sorted = [arriveAlice, arriveBob, leaveAlice, leaveBob]
            .sorted { d1, d2 in smallerOrEqual(d1, d2)
            }

        var result = 0
        var current: Date = sorted[0]
        let to: Date = sorted[3]

        while smallerOrEqual(current, to) {
            if contains(current, arriveAlice, leaveAlice)
                && contains(current, arriveBob, leaveBob)
            {
                result += 1
            }

            current.day += 1
            if current.day > numberOfDays[current.month - 1] {
                current.month += 1
                current.day = 1
            }
        }

        return result
    }

    func run() {
        print(
            countDaysTogether(
                "08-15",
                "08-18",
                "08-16",
                "08-19"
            )
        )  // 3

        print(
            countDaysTogether(
                "10-01",
                "10-31",
                "11-01",
                "12-31"
            )
        )  // 0

        print(
            countDaysTogether(
                "09-01",
                "10-19",
                "06-19",
                "10-20"
            )
        )  // 0
    }
}
