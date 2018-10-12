//
//  FiveMinutes.swift
//  BerlinClock
//
//  Created by Dmytro Pylypenko on 10/12/18.
//  Copyright © 2018 Dmytro Pylypenko. All rights reserved.
//

import Foundation

struct FiveMinutes: Unitable {
    static var count: Int { return 11 }
    static var delimiter: Int { return 59 }
    
    private static var divider: Int { return FiveMinutes.delimiter / FiveMinutes.count }
    
    private(set) var int: Int = 0
    private(set) var string: String = ""
    
    init(fromInt value: Int) {
        int = value
        
        let index = value / FiveMinutes.divider
        string = (0..<FiveMinutes.count)
            .map { i -> String in
                guard i < index else { return "O" }
                return i % 3 == 2 ? "R" : "Y"
            }
            .reduce("", +)
    }
    
    init(fromString value: String) {
        let index = value.split(separator: "O").first?.count ?? 0
        
        int = index * FiveMinutes.divider
        string = value
    }
}
