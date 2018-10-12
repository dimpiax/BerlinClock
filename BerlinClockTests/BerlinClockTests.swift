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
        // test single minutes
        XCTAssertEqual(BerlinClockModel.convertDigitalTime(value: "00:00:00", include: [.singleMinutes]), "OOOO")
        XCTAssertEqual(BerlinClockModel.convertDigitalTime(value: "23:59:59", include: [.singleMinutes]), "YYYY")
        XCTAssertEqual(BerlinClockModel.convertDigitalTime(value: "12:32:00", include: [.singleMinutes]), "YYOO")
        XCTAssertEqual(BerlinClockModel.convertDigitalTime(value: "12:34:00", include: [.singleMinutes]), "YYYY")
        XCTAssertEqual(BerlinClockModel.convertDigitalTime(value: "12:35:00", include: [.singleMinutes]), "OOOO")
        
        // test five minutes
        XCTAssertEqual(BerlinClockModel.convertDigitalTime(value: "00:00:00", include: [.fiveMinutes]), "OOOOOOOOOOO")
        XCTAssertEqual(BerlinClockModel.convertDigitalTime(value: "23:59:59", include: [.fiveMinutes]), "YYRYYRYYRYY")
        XCTAssertEqual(BerlinClockModel.convertDigitalTime(value: "12:04:00", include: [.fiveMinutes]), "OOOOOOOOOOO")
        XCTAssertEqual(BerlinClockModel.convertDigitalTime(value: "12:23:00", include: [.fiveMinutes]), "YYRYOOOOOOO")
        XCTAssertEqual(BerlinClockModel.convertDigitalTime(value: "12:35:00", include: [.fiveMinutes]), "YYRYYRYOOOO")
        
        // test single hours
        XCTAssertEqual(BerlinClockModel.convertDigitalTime(value: "00:00:00", include: [.singleHours]), "OOOO")
        XCTAssertEqual(BerlinClockModel.convertDigitalTime(value: "23:59:59", include: [.singleHours]), "RRRO")
        XCTAssertEqual(BerlinClockModel.convertDigitalTime(value: "02:04:00", include: [.singleHours]), "RROO")
        XCTAssertEqual(BerlinClockModel.convertDigitalTime(value: "08:23:00", include: [.singleHours]), "RRRO")
        XCTAssertEqual(BerlinClockModel.convertDigitalTime(value: "14:35:00", include: [.singleHours]), "RRRR")
        
        // test five hours
        XCTAssertEqual(BerlinClockModel.convertDigitalTime(value: "00:00:00", include: [.fiveHours]), "OOOO")
        XCTAssertEqual(BerlinClockModel.convertDigitalTime(value: "23:59:59", include: [.fiveHours]), "RRRR")
        XCTAssertEqual(BerlinClockModel.convertDigitalTime(value: "02:04:00", include: [.fiveHours]), "OOOO")
        XCTAssertEqual(BerlinClockModel.convertDigitalTime(value: "08:23:00", include: [.fiveHours]), "ROOO")
        XCTAssertEqual(BerlinClockModel.convertDigitalTime(value: "16:35:00", include: [.fiveHours]), "RRRO")
        
        // test seconds
        XCTAssertEqual(BerlinClockModel.convertDigitalTime(value: "00:00:00", include: [.seconds]), "Y")
        XCTAssertEqual(BerlinClockModel.convertDigitalTime(value: "23:59:59", include: [.seconds]), "O")
        
        // test all units
        XCTAssertEqual(BerlinClockModel.convertDigitalTime(value: "00:00:00"), "YOOOOOOOOOOOOOOOOOOOOOOO")
        XCTAssertEqual(BerlinClockModel.convertDigitalTime(value: "23:59:59"), "ORRRRRRROYYRYYRYYRYYYYYY")
        XCTAssertEqual(BerlinClockModel.convertDigitalTime(value: "16:50:06"), "YRRROROOOYYRYYRYYRYOOOOO")
        XCTAssertEqual(BerlinClockModel.convertDigitalTime(value: "11:37:01"), "ORROOROOOYYRYYRYOOOOYYOO")
    }
    
    func testBerlinTime() {
        XCTAssertEqual(BerlinClockModel.convertBerlinTime(value: "OOOO", include: [.singleMinutes]), "00:00:00")
        XCTAssertEqual(BerlinClockModel.convertBerlinTime(value: "OOOOOOOOOOO", include: [.fiveMinutes]), "00:00:00")
        XCTAssertEqual(BerlinClockModel.convertBerlinTime(value: "OOOO", include: [.singleHours]), "00:00:00")
        XCTAssertEqual(BerlinClockModel.convertBerlinTime(value: "OOOO", include: [.fiveHours]), "00:00:00")
        XCTAssertEqual(BerlinClockModel.convertBerlinTime(value: "O", include: [.seconds]), "00:00:01")
        
        XCTAssertEqual(BerlinClockModel.convertBerlinTime(value: "YOOOOOOOOOOOOOOOOOOOOOOO"), "00:00:00")
        XCTAssertEqual(BerlinClockModel.convertBerlinTime(value: "ORRRRRRROYYRYYRYYRYYYYYY", include: [.singleMinutes]), "00:04:00")
        XCTAssertEqual(BerlinClockModel.convertBerlinTime(value: "ORRRRRRROYYRYYRYYRYYYYYY", include: [.fiveMinutes]), "00:55:00")
        XCTAssertEqual(BerlinClockModel.convertBerlinTime(value: "ORRRRRRROYYRYYRYYRYYYYYY", include: [.singleHours]), "03:00:00")
        XCTAssertEqual(BerlinClockModel.convertBerlinTime(value: "ORRRRRRROYYRYYRYYRYYYYYY", include: [.fiveHours]), "20:00:00")
        XCTAssertEqual(BerlinClockModel.convertBerlinTime(value: "ORRRRRRROYYRYYRYYRYYYYYY", include: [.seconds]), "00:00:01")
        
        XCTAssertEqual(BerlinClockModel.convertBerlinTime(value: "YYRYYRYYRYO", include: [.fiveMinutes]), "00:50:00")
        XCTAssertEqual(BerlinClockModel.convertBerlinTime(value: "ORROOROOOYYRYYRYOOOOYYOO"), "11:37:01")
        
        XCTAssertEqual(BerlinClockModel.convertBerlinTime(value: "YOOOOOOOOOOOOOOOOOOOOOOO"), "00:00:00")
        XCTAssertEqual(BerlinClockModel.convertBerlinTime(value: "ORRRRRRROYYRYYRYYRYYYYYY"), "23:59:01")
        XCTAssertEqual(BerlinClockModel.convertBerlinTime(value: "YRRROROOOYYRYYRYYRYOOOOO"), "16:50:00")
        XCTAssertEqual(BerlinClockModel.convertBerlinTime(value: "ORROOROOOYYRYYRYOOOOYYOO"), "11:37:01")
    }
}
