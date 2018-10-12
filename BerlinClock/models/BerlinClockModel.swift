//
//  BerlinClockModel.swift
//  BerlinClock
//
//  Created by Dmytro Pylypenko on 10/12/18.
//  Copyright © 2018 Dmytro Pylypenko. All rights reserved.
//

import Foundation

struct BerlinClockModel {
    static func convertBerlinTime(value: String, dateFormat: String = "HH:mm:ss", include: Set<UnitType> = Set(UnitType.allValues)) throws -> String {
        let rawDict: [UnitType] = [
            .seconds,
            .singleMinutes,
            .fiveMinutes,
            .singleHours,
            .fiveHours,
        ]
            .filter(include.contains)
        
        let pairs = rawDict.map { ($0, LanguageConverter.prepare(value: value, for: $0)) }
        let dict = Dictionary(uniqueKeysWithValues: pairs)

        // set default values for accumulation
        var dataComponents = DateComponents(hour: 0, minute: 0)
        
        // fill data components with evaluated data
        dict
            .map { pair in (key: pair.key, value: pair.key.entity.init(fromString: pair.value).int) }
            .forEach { pair in
                switch pair.key {
                case .seconds: dataComponents.second = pair.value
                case .singleMinutes: dataComponents.minute! += pair.value
                case .fiveMinutes: dataComponents.minute! += pair.value
                case .singleHours: dataComponents.hour! += pair.value
                case .fiveHours: dataComponents.hour! += pair.value
                }
            }
        
        guard let date = Calendar.current.date(from: dataComponents) else {
            throw TranslationError.DateComponents
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        return formatter.string(from: date)
    }
    
    static func convertDigitalTime(value: String, dateFormat: String = "HH:mm:ss", include: Set<UnitType> = Set(UnitType.allValues)) throws -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        
        guard let date = formatter.date(from: value) else {
            throw TranslationError.DateFormat(value, dateFormat)
        }
        
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
            .sorted(by: { $0.0.index - $1.0.index < 0 })
            .map { pair in pair.0.entity.init(fromInt: pair.1) }
            .map { $0.string }
        
        return result.reduce("", +)
    }
}
