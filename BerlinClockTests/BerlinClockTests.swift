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
    func testDigitalTime() {
        XCTAssertEqual(BerlinClockModel.convertDigitalTime(value: "00:00:00"), "OOOOOOOOOOOOOOO")
        XCTAssertEqual(BerlinClockModel.convertDigitalTime(value: "23:59:59"), "YYRYYRYYRYYYYYY")
    }
}
