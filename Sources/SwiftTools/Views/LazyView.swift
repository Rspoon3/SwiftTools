//
//  LazyView.swift
//  EZRequest
//
//  Created by Richard Witherspoon on 3/2/20.
//  Copyright © 2020 InterPro Solutions, LLC. All rights reserved.
//

import SwiftUI

public struct LazyView<Content: View>: View {
    let build: () -> Content
    
    public init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    
    public var body: Content {
        build()
    }
}
