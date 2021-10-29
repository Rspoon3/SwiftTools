//
//  UIEdgeInsets+Extension.swift
//  RSWTools
//
//  Created by Richard Witherspoon on 5/19/19.
//  Copyright © 2019 Richard Witherspoon. All rights reserved.
//

import UIKit

public extension UIEdgeInsets {
    static func allSides(_ side: CGFloat) -> UIEdgeInsets {
        return .init(top: side, left: side, bottom: side, right: side)
    }
}
