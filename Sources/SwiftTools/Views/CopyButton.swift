//
//  CopyButton.swift
//  RSWToolsPreview
//
//  Created by Richard Witherspoon on 4/22/21.
//

import SwiftUI

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, visionOS 1.0, *)
public struct CopyButton: View {
    let text: String
    
    public init(text: String){
        self.text = text
    }
    
    public var body: some View {
        Button("Copy", symbol: .copy){
            UIPasteboard.general.string = text
        }
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, visionOS 1.0, *)
struct CopyButton_Previews: PreviewProvider {
    static var previews: some View {
        CopyButton(text: "This is the sentence too copy to the pasteboard.")
    }
}
