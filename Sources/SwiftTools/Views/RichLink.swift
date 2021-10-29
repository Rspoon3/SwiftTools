//
//  RichLink.swift
//  Cinematic
//
//  Created by Richard Witherspoon on 10/31/20.
//  Copyright © 2020 Richard Witherspoon. All rights reserved.
//  https://www.appcoda.com/linkpresentation-framework/


import SwiftUI
import LinkPresentation


public struct RichLinkView: UIViewRepresentable {
    var richLink: RichLink
    
    public init(richLink: RichLink){
        self.richLink = richLink
    }
    
    public func makeUIView(context: Context) -> LPLinkView {
        guard let metadata = richLink.metadata else {
            return LPLinkView()
        }
        let linkView = LPLinkView(metadata: metadata)
        return linkView
    }

    public func updateUIView(_ uiView: LPLinkView, context: Context) {
    }
}

struct RichLink_Previews: PreviewProvider {
    static var previews: some View {
        RichLinkView(richLink: .previewData)
    }
}


public class RichLink: NSObject, NSSecureCoding, Identifiable {
    var id: Int!
    var metadata: LPLinkMetadata!

    
    // MARK: - Initializer
    public init(for metadata: LPLinkMetadata) {
        super.init()
        id = Int(Date.timeIntervalSinceReferenceDate)
        self.metadata = metadata
    }
    
    
    // MARK: - NSSecureCoding Requirements
    public static var supportsSecureCoding = true

    public func encode(with coder: NSCoder) {
        guard let id = id, let metadata = metadata else { return }
        coder.encode(NSNumber(integerLiteral: id), forKey: "id")
        coder.encode(metadata as NSObject, forKey: "metadata")
    }

    required public init?(coder: NSCoder) {
        id = coder.decodeObject(of: NSNumber.self, forKey: "id")?.intValue
        metadata = coder.decodeObject(of: LPLinkMetadata.self, forKey: "metadata")
    }
    
    // MARK: - PreviewData
    public static var previewData: RichLink{
        let urlString = "https://www.themoviedb.org/movie/299537-captain-marvel"
        let url = URL(string: urlString)!
        let metadata = LPLinkMetadata()
        metadata.originalURL = url
        return RichLink(for: metadata)
    }
}
