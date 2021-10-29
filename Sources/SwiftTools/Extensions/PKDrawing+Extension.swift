//
//  PKDrawing+Extension.swift
//  NYAB Field Service
//
//  Created by Richard Witherspoon on 4/11/21.
//  Copyright © 2021 Richard Witherspoon. All rights reserved.
//

import Foundation
import PencilKit


public extension PKDrawing {
    var isBlank: Bool {
        return self.bounds == CGRect(origin: CGPoint(x: CGFloat.infinity, y: CGFloat.infinity), size: .zero)
    }
}

