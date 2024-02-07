//
//  ColoredBadgeIconLabelStyle.swift
//  
//
//  Created by Richard Witherspoon on 11/10/21.
//

import SwiftUI

///Adds the icon to the trailing edge of the view with a large image scale
///- Authors: Richard Witherspoon
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, visionOS 1.0, *)
public struct ColoredBadgeIconLabelStyle: LabelStyle {
    let color: Color
    
    init(_ color: Color){
        self.color = color
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
                .frame(maxWidth: .infinity, alignment: .leading)
            configuration.icon
                .imageScale(.large)
                .foregroundColor(color)
        }
    }
}


///Adds the icon to the trailing edge of the view with a large image scale
///- Authors: Richard Witherspoon
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, visionOS 1.0, *)
public extension LabelStyle where Self == ColoredBadgeIconLabelStyle {
    static func coloredBadge(_ color: Color) -> ColoredBadgeIconLabelStyle {
        ColoredBadgeIconLabelStyle(color)
    }
}

