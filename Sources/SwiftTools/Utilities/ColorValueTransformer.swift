//
//  ColorValueTransformer.swift
//  Study Sets
//
//  Created by Richard Witherspoon on 12/7/20.
//  Copyright © 2020 Richard Witherspoon. All rights reserved.
//  https://www.kairadiagne.com/2020/01/13/nssecurecoding-and-transformable-properties-in-core-data.html

import UIKit


@objc(UIColorValueTransformer)
public final class ColorValueTransformer: NSSecureUnarchiveFromDataTransformer {

    static let name = NSValueTransformerName(rawValue: String(describing: ColorValueTransformer.self))

    public override static var allowedTopLevelClasses: [AnyClass] {
        return [UIColor.self]
    }

    public static func register() {
        let transformer = ColorValueTransformer()
        ValueTransformer.setValueTransformer(transformer, forName: name)
    }
}
