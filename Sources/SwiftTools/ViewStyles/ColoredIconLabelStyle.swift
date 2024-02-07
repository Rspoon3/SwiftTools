//
//  ColoredIconLabelStyle.swift
//  
//
//  Created by Richard Witherspoon on 11/10/21.
//

import SwiftUI


///Tints the icon to the specified color
///- Authors: Richard Witherspoon
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, visionOS 1.0, *)
public struct ColoredIconLabelStyle: LabelStyle {
    let color: Color
    
    init(_ color: Color){
        self.color = color
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        Label {
            configuration.title
        } icon: {
            configuration.icon
                .foregroundColor(color)
        }
    }
}


///Tints the icon to the specified color
///- Authors: Richard Witherspoon
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, visionOS 1.0, *)
public extension LabelStyle where Self == ColoredIconLabelStyle {
    static func coloredIcon(_ color: Color) -> ColoredIconLabelStyle {
        ColoredIconLabelStyle(color)
    }
}
