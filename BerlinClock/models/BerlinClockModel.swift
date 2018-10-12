//
//  BerlinClockModel.swift
//  BerlinClock
//
//  Created by Dmytro Pylypenko on 10/12/18.
//  Copyright © 2018 Dmytro Pylypenko. All rights reserved.
//

import Foundation

struct BerlinClockModel {
    static func convertBerlinTime(value: String) -> String {
        notImplemented()
    }
    
    static func convertDigitalTime(value: String, dateFormat: String = "HH:mm:ss", include: Set<UnitType> = Set(UnitType.allValues)) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        
        // TODO: update function to throws specific errors
        let date = formatter.date(from: value)!
        
        let dateComponents = Calendar.current.dateComponents([
            .second,
            .minute,
            .hour,
        ], from: date)
        
        let rawDict: [UnitType: Int?] = [
            .seconds: dateComponents.second,
            .singleMinutes: dateComponents.minute,
            .fiveMinutes: dateComponents.minute,
            .singleHours: dateComponents.hour,
            .fiveHours: dateComponents.hour,
        ]
            .filter { include.contains($0.key) }
        
        let dict = rawDict.compactMap { $0.1 == nil ? nil : ($0.0, $0.1!) }
        let result = dict
            .sorted(by: { $0.0.rawValue - $1.0.rawValue > 0 })
            .map { pair in pair.0.entity.init(fromInt: pair.1) }
            .map { $0.string }
        
        return result.reduce("", +)
    }
}
