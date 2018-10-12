//
//  SingleMinutes.swift
//  BerlinClock
//
//  Created by Dmytro Pylypenko on 10/12/18.
//  Copyright © 2018 Dmytro Pylypenko. All rights reserved.
//

import Foundation

struct SingleMinutes: Unitable {
    private(set) var string: String = ""
    
    init(fromInt value: Int) {
        let value = value % 5
        string = (0..<4)
            .map { index in index >= value ? "O" : "Y" }
            .reduce("", +)
    }
    
    init(fromString value: String) {
        string = value
    }
}
