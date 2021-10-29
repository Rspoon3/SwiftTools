//
//  UserDefaultCodable.swift
//  Cinematic
//
//  Created by Richard Witherspoon on 10/22/20.
//  Copyright © 2020 Richard Witherspoon. All rights reserved.
//

import Foundation

@propertyWrapper
public struct UserDefaultCodable<T: Codable> {
    let key: String
    let userDefaults: UserDefaults
    let defaultValue: T
    
    public init(_ key: String, userDefaults: UserDefaults = .standard, defaultValue: T) {
        self.key = key
        self.userDefaults = userDefaults
        self.defaultValue = defaultValue
    }
    
    public var wrappedValue: T {
        get {
            guard let data = userDefaults.data(forKey: key),
                  let decoded = try? JSONDecoder().decode(T.self, from: data)
            else {
                return defaultValue
            }
            
            return decoded
        }
        set {
            if let encoded = try? JSONEncoder().encode(newValue) {
                userDefaults.set(encoded, forKey: key)
            }
        }
    }
}
