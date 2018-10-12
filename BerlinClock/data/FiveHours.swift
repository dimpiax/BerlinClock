//
//  FiveHours.swift
//  BerlinClock
//
//  Created by Dmytro Pylypenko on 10/12/18.
//  Copyright © 2018 Dmytro Pylypenko. All rights reserved.
//

import Foundation

struct FiveHours: Unitable {
    static var count: Int { return 4 }
    static var delimiter: Int { return 20 }
    private static var divider: Int { return FiveMinutes.delimiter / FiveMinutes.count }
    
    private(set) var int: Int = 0
    private(set) var string: String = ""
    
    init(fromInt value: Int) {
        int = value
        
        let index = value / FiveHours.divider
        string = (0..<FiveHours.count)
            .map { $0 >= index ? "O" : "R" }
            .reduce("", +)
    }
    
    init(fromString value: String) {
        let index = value.split(separator: "O").first?.count ?? 0
        
        int = index * FiveHours.divider
        string = value
    }
}
