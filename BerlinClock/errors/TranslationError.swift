//
//  TranslationError.swift
//  BerlinClock
//
//  Created by Dmytro Pylypenko on 12/10/2018.
//  Copyright © 2018 Dmytro Pylypenko. All rights reserved.
//

import Foundation

enum TranslationError: Error {
    case DateFormat(String, String)
    case DateComponents
}
