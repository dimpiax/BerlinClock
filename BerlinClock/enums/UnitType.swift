//
//  UnitType.swift
//  BerlinClock
//
//  Created by Dmytro Pylypenko on 10/12/18.
//  Copyright © 2018 Dmytro Pylypenko. All rights reserved.
//

import Foundation

enum UnitType {
    case singleHours, fiveHours
    case singleMinutes, fiveMinutes
    case seconds
    
    var index: Int {
        switch self {
        case .singleMinutes: return 4
        case .fiveMinutes: return 3
        case .singleHours: return 2
        case .fiveHours: return 1
        case .seconds: return 0
        }
    }
    
    var entity: Unitable.Type {
        switch self {
        case .singleMinutes: return SingleMinutes.self
        case .fiveMinutes: return FiveMinutes.self
        case .singleHours: return SingleHours.self
        case .fiveHours: return FiveHours.self
        case .seconds: return Seconds.self
        }
    }
    
    static let allValues: [UnitType] = {
        return [singleMinutes, fiveMinutes, singleHours, fiveHours, seconds]
            .sorted(by: { $0.index - $1.index < 0 })
    }()
}
