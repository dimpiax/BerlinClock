//
//  SingleHours.swift
//  BerlinClock
//
//  Created by Dmytro Pylypenko on 10/12/18.
//  Copyright © 2018 Dmytro Pylypenko. All rights reserved.
//

import Foundation

struct SingleHours: Unitable {
    private(set) var string: String = ""
    
    init(fromInt value: Int) {
        let value = value % 5
        
        string = (0..<4)
            .map { index in index >= value ? "O" : "R" }
            .reduce("", +)
    }
    
    init(fromString value: String) {
        string = value
    }
}
