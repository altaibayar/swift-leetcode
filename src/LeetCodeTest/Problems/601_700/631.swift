//
//  631.swift
//  LeetCodeTest
//
//  Created by a on 11/06/2026.
//  Copyright © 2026 tsevealt. All rights reserved.
//

private class Excel {

    var sheet: Sheet

    init(_ height: Int, _ width: Character) {
        let width = width.index + 1
        sheet = Sheet(height, width)
    }

    func set(_ row: Int, _ column: Character, _ val: Int) {
        let coordinate = Coordinate(row: row, column: column)
        sheet.setCell(.number(val), at: coordinate)
    }

    func get(_ row: Int, _ column: Character) -> Int {
        var cache: [Coordinate: Int] = [:]
        func calculateValue(at coordinate: Coordinate) -> Int {
            if let cached = cache[coordinate] {
                return cached
            }

            let cell = sheet.cell(at: coordinate)
            switch cell {
            case .number(let value):
                return value
            case .sum(let ranges):
                var sum = 0
                for range in ranges {
                    range.iterate {
                        sum += calculateValue(at: $0)
                    }
                }
                cache[coordinate] = sum
                return sum
            }
        }

        let coordinate = Coordinate(row: row, column: column)
        return calculateValue(at: coordinate)
    }

    func sum(_ row: Int, _ column: Character, _ numbers: [String]) -> Int {
        let ranges: [Range]
        do {
            ranges = try numbers.map { try Range(string: $0) }
        } catch {
            return -1
        }

        let coordinate = Coordinate(row: row, column: column)
        sheet.setCell(.sum(ranges), at: coordinate)
        return get(row, column)
    }
}

extension Excel {

    private func letterToIndex(_ letter: Character) -> Int {
        letter.index
    }
}

struct Sheet {

    enum Cell {
        case number(Int)
        case sum([Range])
    }

    var cells: [[Cell]]

    init(_ height: Int, _ width: Int) {
        cells = Array(repeating: Array(repeating: .number(0), count: width), count: height)
    }

    func cell(at coordinate: Coordinate) -> Cell {
        return cells[coordinate.row][coordinate.column]
    }

    mutating func setCell(_ cell: Cell, at coordinate: Coordinate) {
        cells[coordinate.row][coordinate.column] = cell
    }
}

struct Range {

    let topLeading: Coordinate
    let bottomTrailing: Coordinate

    init(string: String) {
        let coordinates: [Coordinate]
        coordinates =
            string
            .split(separator: ":")
            .map { Coordinate(string: String($0)) }

        if coordinates.count == 1 {
            topLeading = coordinates[0]
            bottomTrailing = coordinates[0]
        } else {
            topLeading = coordinates[0]
            bottomTrailing = coordinates[1]
        }
    }

    func iterate(_ closure: ((Coordinate) -> Void)) {
        for row in topLeading.row...bottomTrailing.row {
            for column in topLeading.column...bottomTrailing.column {
                let coordinate = Coordinate(row: row, column: column)
                closure(coordinate)
            }
        }
    }
}

struct Coordinate: Hashable {

    let row: Int
    let column: Int

    init(row: Int, column: Int) {
        self.row = row
        self.column = column
    }

    init(string: String) {
        let characters = Array(string)
        var row: Int = characters[1].wholeNumberValue ?? 0
        if characters.count > 2 {
            row = row * 10 + (characters[2].wholeNumberValue ?? 0)
        }
        self.row = row - 1  // Convert to 0-indexed.
        self.column = characters[0].index
    }

    init(row: Int, column: Character) {
        self.row = row - 1  // Convert to 0-indexed.
        self.column = column.index
    }
}

extension Character {

    private static let shift = Int(Character("A").asciiValue ?? 0)
    fileprivate var index: Int {
        Int(asciiValue ?? 0) - Character.shift
    }
}

class Problem_631: ProblemProtocol {

    class Excel1 {

        enum Cell {
            case number(Int)
            case sum([String])
        }

        var data: [[Cell]]

        init(_ height: Int, _ width: Character) {
            let col = Excel1.col(from: width) + 1

            data = [[Cell]](
                repeating: [Cell](repeating: .number(0), count: col),
                count: height
            )
        }

        func set(_ row: Int, _ column: Character, _ val: Int) {
            data[row - 1][Excel1.col(from: column)] = .number(val)
        }

        func get(_ row: Int, _ column: Character) -> Int {
            let cell = data[row - 1][Excel1.col(from: column)]

            switch cell {
            case .number(let val): return val
            case .sum(let vals): return calculateSums(for: vals)
            }
        }

        func sum(_ row: Int, _ column: Character, _ numbers: [String]) -> Int {
            data[row - 1][Excel1.col(from: column)] = .sum(numbers)
            return get(row, column)
        }

        // "A1", "A1:B2"
        private func parseCoord(from cell: String) -> (row: Int, col: Character) {
            return (
                row: Int(String(cell[cell.index(after: cell.startIndex)..<cell.endIndex]))!,
                col: cell[cell.startIndex]
            )
        }

        private func calculateSums(for ranges: [String]) -> Int {
            var result = 0

            var memo: [String: Int] = [:]

            for range in ranges {
                let fromRow: Int
                let fromCol: Character
                let toRow: Int
                let toCol: Character

                if range.contains(":") {
                    (fromRow, fromCol) = parseCoord(from: String(range.split(separator: ":")[0]))
                    (toRow, toCol) = parseCoord(from: String(range.split(separator: ":")[1]))
                } else {
                    (fromRow, fromCol) = parseCoord(from: range)

                    toRow = fromRow
                    toCol = fromCol
                }

                for row in fromRow...toRow {
                    for col in Excel1.col(from: fromCol)...Excel1.col(from: toCol) {
                        let char = Character(
                            UnicodeScalar(col + 65)!
                        )

                        let key = "\(char)_\(row)"

                        if let m = memo[key] {
                            result += m
                        } else {
                            let tmp = get(row, char)
                            memo[key] = tmp
                            result += tmp
                        }
                    }
                }
            }

            return result
        }

        private static func col(from column: Character) -> Int {
            guard let val1 = column.asciiValue, let val2 = Character("A").asciiValue else {
                fatalError()
            }

            return Int(val1 - val2)
        }
    }

    func run() {
        let excel = Excel(3, "C")
        excel.set(1, "A", 2)
        print(excel.sum(3, "C", ["A1", "A1:B2"]))
        excel.set(2, "B", 2)
        print(excel.get(3, "C"))
    }
}
