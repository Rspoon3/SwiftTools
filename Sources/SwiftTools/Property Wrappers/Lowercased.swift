//
//  Lowercased.swift
//  
//
//  Created by Richard Witherspoon on 11/3/21.
//

import Foundation


@propertyWrapper struct Lowercased {
    var wrappedValue: String {
        didSet {
            wrappedValue = wrappedValue.lowercased()
        }
    }
    
    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue.lowercased()
    }
}
