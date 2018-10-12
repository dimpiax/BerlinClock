//
//  Unitable.swift
//  BerlinClock
//
//  Created by Dmytro Pylypenko on 10/12/18.
//  Copyright © 2018 Dmytro Pylypenko. All rights reserved.
//

import Foundation

protocol Unitable {
    var string: String { get }
    
    init(fromInt: Int)
    init(fromString: String)
}
