//
//  SingleHours.swift
//  BerlinClock
//
//  Created by Dmytro Pylypenko on 10/12/18.
//  Copyright © 2018 Dmytro Pylypenko. All rights reserved.
//

import Foundation

struct SingleHours: Unitable {
    static var count: Int { return 4 }
    static var delimiter: Int { return 5 }
    
    private(set) var int: Int = 0
    private(set) var string: String = ""
    
    init(fromInt value: Int) {
        int = value
        
        let value = value % SingleHours.delimiter
        string = (0..<SingleHours.count)
            .map { index in index >= value ? "O" : "R" }
            .reduce("", +)
    }
    
    init(fromString value: String) {
        let index = value.split(separator: "O").first?.count ?? 0
        
        int = index % SingleHours.delimiter
        string = value
    }
}
