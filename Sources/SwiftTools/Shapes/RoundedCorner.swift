//
//  RoundedCorner.swift
//  Study Sets
//
//  Created by Richard Witherspoon on 4/27/20.
//  Copyright © 2020 Richard Witherspoon. All rights reserved.
//

import SwiftUI


internal struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
