//
//  BerlinClockTests.swift
//  BerlinClockTests
//
//  Created by Dmytro Pylypenko on 10/10/18.
//  Copyright © 2018 Dmytro Pylypenko. All rights reserved.
//

import XCTest
@testable import BerlinClock



class BerlinClockTests: XCTestCase {
    func testFifthLine() {
        getFifthLine(value: "00:00:00", expected: "OOOO")
        getFifthLine(value: "23:59:59", expected: "YYYY")
        getFifthLine(value: "12:32:00", expected: "YYOO")
        getFifthLine(value: "12:34:00", expected: "YYYY")
        getFifthLine(value: "12:35:00", expected: "OOOO")
    }
    
    func testFourthLine() {
//        getFourthLine(value: "00:00:00", expected: "OOOOOOOOOOO")
//        getFourthLine(value: "23:59:59", expected: "YYRYYRYYRYY")
//        getFourthLine(value: "12:04:00", expected: "OOOOOOOOOOO")
//        getFourthLine(value: "12:23:00", expected: "YYRYOOOOOOO")
//        getFourthLine(value: "12:35:00", expected: "YYRYYRYOOOO")
    }
    
    func getFifthLine(value: String, expected: String) {
        do {
            let res = try Converter().getFifthLine(value: value)
            XCTAssertEqual(res, expected)
        } catch {
            print(error)
            XCTAssert(false)
        }
    }
    
    func getFourthLine(value: String, expected: String) {
        do {
            let res = try Converter().getFourthLine(value: value)
            XCTAssertEqual(res, expected)
        } catch {
            print(error)
            XCTAssert(false)
        }
    }

}

struct Converter {
    func getFifthLine(value: String, dateFormat: String = "HH:mm:ss") throws -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        
        guard
            let date = formatter.date(from: value),
            let minute = Calendar.current.dateComponents([.minute], from: date).minute
        else {
            throw FormatError.wrongDateFormat
        }
        
        let count = minute % 5
        var arr = Array(repeating: "O", count: 4)
        for index in 0..<count {
            arr[index] = "Y"
        }
        
        return arr.joined(separator: "")
    }
    
    func getFourthLine(value: String, dateFormat: String = "HH:mm:ss") throws -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        
        guard
            let date = formatter.date(from: value),
            let minute = Calendar.current.dateComponents([.minute], from: date).minute
            else {
                throw FormatError.wrongDateFormat
        }
        
        let count = minute/12
        print("count: \(count)")
        var arr = Array(repeating: "O", count: 11)
        for index in 0..<count {
//            if (index != 0 && index % 3 == 0) {
            if (index % 5 == 2) {
                arr[index] = "R"
                continue
            }
            arr[index] = "Y"
        }
        
        
        
        return arr.joined(separator: "")
    }
}

enum FormatError: Error {
    case wrongDateFormat
}

protocol Unitable {
    
}

struct BerlinClockString {
    init(value: String) throws {
        // TODO: validation
    }
}

struct BerlinClockData {
    struct Minute: Unitable {
        
    }
    
    struct Second: Unitable {
        
    }
    
    init(value: BerlinClockString) {
        // TODO: build each unit from string
    }
    
    init(value: Date) {
        // TODO: build each unit from string
    }
}

struct Translator {
    static func convertChars(value: String) throws -> BerlinClockData {
        let value = try BerlinClockString(value: value)
        return BerlinClockData(value: value)
    }
    
    static func convertDate(value: String, dateFormat: String = "HH:mm:ss") throws -> BerlinClockData {
        // TODO: convert to date
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        guard let date = formatter.date(from: value) else {
            throw FormatError.wrongDateFormat
        }
        
        return BerlinClockData(value: date)
    }
}
