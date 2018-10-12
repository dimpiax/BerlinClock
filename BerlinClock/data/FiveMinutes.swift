//
//  FiveMinutes.swift
//  BerlinClock
//
//  Created by Dmytro Pylypenko on 10/12/18.
//  Copyright © 2018 Dmytro Pylypenko. All rights reserved.
//

import Foundation

struct FiveMinutes: Unitable {
    private(set) var string: String = ""
    
    init(fromInt value: Int) {
        let value = value / 5
        
        string = (0..<11)
            .map { index -> String in
                guard index < value else { return "O" }
                return index % 3 == 2 ? "R" : "Y"
            }
            .reduce("", +)
    }
    
    init(fromString value: String) {
        string = value
    }
}
