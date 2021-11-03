//
//  AllLowercased.swift
//  
//
//  Created by Richard Witherspoon on 11/3/21.
//

import Foundation


@propertyWrapper
public struct AllLowercased {
    public var wrappedValue: [String] {
        didSet {
            wrappedValue = wrappedValue.map{$0.lowercased() }
        }
    }
    
    public init(wrappedValue: [String]) {
        self.wrappedValue = wrappedValue.map{$0.lowercased() }
    }
}
