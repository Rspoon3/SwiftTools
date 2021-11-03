//
//  Lowercased.swift
//  
//
//  Created by Richard Witherspoon on 11/3/21.
//

import Foundation


@propertyWrapper
public struct Lowercased {
    public var wrappedValue: String {
        didSet {
            wrappedValue = wrappedValue.lowercased()
        }
    }
    
    public init(wrappedValue: String) {
        self.wrappedValue = wrappedValue.lowercased()
    }
}
