//
//  PHPickerConfiguration+Extension.swift
//  
//
//  Created by Richard Witherspoon on 10/31/21.
//

import Foundation
import PhotosUI

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, visionOS 1.0, *)
public extension PHPickerConfiguration{
    enum PHPickerConfigurationSelectionLimit: Int{
        case multiple = 0
        case single = 1
    }
    
    init(limit: PHPickerConfigurationSelectionLimit, filter: PHPickerFilter) {
        self.init()
        self.selectionLimit = limit.rawValue
        self.filter = filter
    }
}
