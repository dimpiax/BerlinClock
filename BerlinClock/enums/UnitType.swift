//
//  UnitType.swift
//  BerlinClock
//
//  Created by Dmytro Pylypenko on 10/12/18.
//  Copyright © 2018 Dmytro Pylypenko. All rights reserved.
//

import Foundation

enum UnitType {
    case seconds, singleMinutes
    
    var entity: Unitable.Type {
        switch self {
        case .seconds: return Seconds.self
        case .singleMinutes: return SingleMinutes.self
        }
    }
}
