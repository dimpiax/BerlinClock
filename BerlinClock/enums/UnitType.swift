//
//  UnitType.swift
//  BerlinClock
//
//  Created by Dmytro Pylypenko on 10/12/18.
//  Copyright © 2018 Dmytro Pylypenko. All rights reserved.
//

import Foundation

enum UnitType: Int {
    case seconds = 4
    case singleHours = 2, fiveHours = 3
    case singleMinutes = 0, fiveMinutes = 1
    
    var entity: Unitable.Type {
        switch self {
        case .seconds: return Seconds.self
        case .singleMinutes: return SingleMinutes.self
        case .fiveMinutes: return FiveMinutes.self
        case .singleHours: return SingleHours.self
        case .fiveHours: return FiveHours.self
        }
    }
    
    static var allValues: [UnitType] = [seconds, singleMinutes, fiveMinutes, singleHours, fiveHours]
}
