//
//  Seconds.swift
//  BerlinClock
//
//  Created by Dmytro Pylypenko on 10/12/18.
//  Copyright © 2018 Dmytro Pylypenko. All rights reserved.
//

import Foundation

struct Seconds: Unitable {
    private(set) var string: String = ""
    
    init(fromInt value: Int) {
        string = value % 2 == 1 ? "O" : "Y"
    }
    
    init(fromString value: String) {
        string = value
    }
}
