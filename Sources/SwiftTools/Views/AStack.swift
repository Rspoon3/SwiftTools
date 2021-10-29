//
//  AStack.swift
//  NYAB Field Service
//
//  Created by Richard Witherspoon on 4/7/21.
//  Copyright © 2021 Richard Witherspoon. All rights reserved.
//

import SwiftUI


public struct AStack<Content: View>: View {
    let horizontalAlignment: HorizontalAlignment
    let verticalAlignment: VerticalAlignment
    let spacing: CGFloat?
    let content: () -> Content
    let isVertical: Bool
    
    public init(isVertical: Bool, horizontalAlignment: HorizontalAlignment = .center, verticalAlignment: VerticalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: @escaping () -> Content) {
        self.isVertical = isVertical
        self.horizontalAlignment = horizontalAlignment
        self.verticalAlignment = verticalAlignment
        self.spacing = spacing
        self.content = content
    }
    
    public var body: some View {
        if isVertical {
            VStack(alignment: horizontalAlignment, spacing: spacing, content: content)
        } else {
            HStack(alignment: verticalAlignment, spacing: spacing, content: content)
        }
    }
}


struct AStack_Previews: PreviewProvider {
    struct Container: View{
        @State private var isVertical = true
        
        var body: some View{
            VStack{
                Button("Toggle Rotation"){
                    isVertical.toggle()
                }
                AStack(isVertical: isVertical, spacing: 0){
                    Color.blue
                    Color.red
                }
            }
        }
    }
    
    static var previews: some View {
        Container()
            .padding()
            .frame(width: 200, height: 200)
            .previewLayout(.sizeThatFits)
    }
}
