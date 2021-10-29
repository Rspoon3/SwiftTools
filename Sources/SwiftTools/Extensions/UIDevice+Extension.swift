//
//  UIDevice+Extension.swift
//  Study Sets
//
//  Created by Richard Witherspoon on 5/19/20.
//  Copyright © 2020 Richard Witherspoon. All rights reserved.
//

import UIKit

public extension UIDevice {
    var isSimulator: Bool {
         #if targetEnvironment(simulator)
            return true
        #else
            return false
        #endif
    }
}
