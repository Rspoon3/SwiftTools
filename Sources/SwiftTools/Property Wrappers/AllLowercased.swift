//
//  AllLowercased.swift
//  
//
//  Created by Richard Witherspoon on 11/3/21.
//

import Foundation


@propertyWrapper struct AllLowercased {
    var wrappedValue: [String] {
        didSet {
            wrappedValue = wrappedValue.map{$0.lowercased() }
        }
    }
    
    init(wrappedValue: [String]) {
        self.wrappedValue = wrappedValue.map{$0.lowercased() }
    }
}
