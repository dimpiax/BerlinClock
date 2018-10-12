//
//  LanguageConverter.swift
//  BerlinClock
//
//  Created by Dmytro Pylypenko on 12/10/2018.
//  Copyright © 2018 Dmytro Pylypenko. All rights reserved.
//

import Foundation

struct LanguageConverter {
    static func prepare(value: String, for type: UnitType) -> String {
        let offset = UnitType.allValues.prefix(type.index)
            .reduce(0) { acc, cur in acc + cur.entity.count }
        
        return String(value.prefix(offset + type.entity.count).suffix(type.entity.count))
    }
}
