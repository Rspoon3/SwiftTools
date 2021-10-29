//
//  NumberFormatter+Extension.swift
//  NYAB Field Service
//
//  Created by Richard Witherspoon on 4/8/21.
//  Copyright © 2021 Richard Witherspoon. All rights reserved.
//

import Foundation

public extension NumberFormatter{
    convenience init(numberStyle: NumberFormatter.Style) {
        self.init()
        self.numberStyle = numberStyle
        self.locale = .current
    }
}
