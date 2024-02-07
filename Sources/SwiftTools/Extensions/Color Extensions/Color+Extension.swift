//
//  Color+Extension.swift
//  
//
//  Created by Richard Witherspoon on 1/21/21.
//

import SwiftUI


public extension Color{    
    //MARK: Label
    static let label           = Color(.label)
    static let secondaryLabel  = Color(.secondaryLabel)
    static let tertiaryLabel   = Color(.tertiaryLabel)
    static let quaternaryLabel = Color(.quaternaryLabel)
    
    //MARK: Fill
    static let systemFill           = Color(.systemFill)
    static let secondarySystemFill  = Color(.secondarySystemFill)
    static let tertiarySystemFill   = Color(.tertiarySystemFill)
    static let quaternarySystemFill = Color(.quaternarySystemFill)
    
    //MARK: Text
    static let placeholderText = Color(.placeholderText)
    static let lightText       = Color(.lightText)

    //MARK: System Background
    static let systemBackground          = Color(.systemBackground)
    static let secondarySystemBackground = Color(.secondarySystemBackground)
    static let tertiarySystemBackground  = Color(.tertiarySystemBackground)
    
    //MARK: System Grouped Background
    static let systemGroupedBackground          = Color(.systemGroupedBackground)
    static let secondarySystemGroupedBackground = Color(.secondarySystemGroupedBackground)
    static let tertiarySystemGroupedBackground = Color(.tertiarySystemGroupedBackground)
    
    //MARK: Separator
    static let separator       = Color(.separator)
    static let opaqueSeparator = Color(.opaqueSeparator)
    
    //MARK: Link
    static let link = Color(.link)
    
    //MARK: Gray
    static let systemGray  = Color(.systemGray)
    static let systemGray2 = Color(.systemGray2)
    static let systemGray3 = Color(.systemGray3)
    static let systemGray4 = Color(.systemGray4)
    static let systemGray5 = Color(.systemGray5)
    static let systemGray6 = Color(.systemGray6)

    init(hex: String) {
        self.init(UIColor(hex: hex))
    }
    
    static func random(opacity: CGFloat = 1.0)->Color{
        return Color(.random(alpha: opacity))
    }
    
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, visionOS 1.0, *)
    func lighter(by percentage: CGFloat = 30.0) -> Color {
        let uiColor = UIColor(self)
        let adjustedColor = uiColor.lighter(by: percentage)
        return Color(adjustedColor)
    }
    
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, visionOS 1.0, *)
    func darker(by percentage: CGFloat = 30.0) -> Color {
        let uiColor = UIColor(self)
        let adjustedColor = uiColor.darker(by: percentage)
        return Color(adjustedColor)
    }
}

