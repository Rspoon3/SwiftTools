//
//  Shake.swift
//  NYAB Field Service
//
//  Created by Richard Witherspoon on 3/23/20.
//  Copyright © 2020 Richard Witherspoon. All rights reserved.
//

import SwiftUI

public struct Shake: GeometryEffect {
    var amount: CGFloat = 10
    var shakesPerUnit = 3
    public var animatableData: CGFloat
    
    public init(animatableData: CGFloat){
        self.animatableData = animatableData
    }

    public func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX:
            amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)),
            y: 0))
    }
}
