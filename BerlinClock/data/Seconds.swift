//
//  Seconds.swift
//  BerlinClock
//
//  Created by Dmytro Pylypenko on 10/12/18.
//  Copyright © 2018 Dmytro Pylypenko. All rights reserved.
//

import Foundation

struct Seconds: Unitable {
    static var count: Int { return 1 }
    static var delimiter: Int { return 2 }
    
    private(set) var int: Int = 0
    private(set) var string: String = ""
    
    init(fromInt value: Int) {
        int = value
        string = value % Seconds.delimiter == 1 ? "O" : "Y"
    }
    
    init(fromString value: String) {
        int = value == "O" ? 1 : 0
        string = value
    }
}
