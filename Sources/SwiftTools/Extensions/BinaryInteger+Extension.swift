//
//  BinaryIntegerExtension.swift
//  Math Flash
//
//  Created by Richard Witherspoon on 11/24/19.
//  Copyright © 2019 Richard Witherspoon. All rights reserved.
//

import SwiftUI

public extension BinaryInteger {
    var digits: [Int] {
        return String(describing: self).compactMap { Int(String($0)) }
    }
}
