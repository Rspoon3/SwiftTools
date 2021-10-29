//
//  BadgeIconLabelStyle.swift
//  BadgeIconLabelStyle
//
//  Created by Richard Witherspoon on 8/6/21.
//

import SwiftUI

///Adds the icon to the trailing edge of the view with a large image scale
///- Author: Richard Witherspoon
@available(iOS 14.0, *)
public struct BadgeIconLabelStyle: LabelStyle {
    public func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
                .frame(maxWidth: .infinity, alignment: .leading)
            configuration.icon
                .imageScale(.large)
        }
    }
}


///Adds the icon to the trailing edge of the view with a large image scale
///- Author: Richard Witherspoon
@available(iOS 14.0, *)
public extension LabelStyle where Self == BadgeIconLabelStyle {
    static var badge: BadgeIconLabelStyle {
        get{
            BadgeIconLabelStyle()
        }
    }
}
