//
//  DateFormatter+Extension.swift
//  NYAB Field Service
//
//  Created by Richard Witherspoon on 4/8/21.
//  Copyright © 2021 Richard Witherspoon. All rights reserved.
//

import Foundation

@available(swift, obsoleted: 5.5, message: "This method has been removed. Please use naive formatter APIs.")
public extension DateFormatter{
    convenience init(dateStyle: DateFormatter.Style) {
        self.init()
        self.locale = .current
        self.dateStyle = dateStyle
    }
    
    convenience init(dateFormat: String) {
        self.init()
        self.locale = .current
        self.dateFormat = dateFormat
    }
}
