//
//  LinkPresentationItemSource.swift
//  Cinematic
//
//  Created by Richard Witherspoon on 10/22/20.
//  Copyright © 2020 Richard Witherspoon. All rights reserved.
//

import Foundation
import LinkPresentation

class LinkPresentationItemSource: NSObject, UIActivityItemSource {
    let linkMetaData: LPLinkMetadata
    
    init(metaData: LPLinkMetadata) {
        self.linkMetaData = metaData
    }
    
    //Prepare data to share
    func activityViewControllerLinkMetadata(_ activityViewController: UIActivityViewController) -> LPLinkMetadata? {
        return linkMetaData
    }
    
    //Placeholder for real data, we don't care in this example so just return a simple string
    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        return "Loading..."
    }
    
    /// Return the data will be shared
    /// - Parameters:
    ///   - activityType: Ex: mail, message, airdrop, etc..
    func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        return linkMetaData.originalURL
    }
}
