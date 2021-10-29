//
//  ColorStorage.swift
//  Cinematic
//
//  Created by Richard Witherspoon on 8/16/20.
//  Copyright © 2020 Richard Witherspoon. All rights reserved.
//

import UIKit

@propertyWrapper
public struct ColorStorage {
    let key: String
    let userDefaults: UserDefaults
    let defaultColor: UIColor
    
    public init(_ key: String, userDefaults: UserDefaults = .standard, defaultColor: UIColor) {
        self.key = key
        self.userDefaults = userDefaults
        self.defaultColor = defaultColor
    }
    
    public var wrappedValue: UIColor {
        get {
            guard
                let data = userDefaults.data(forKey: key),
                let decoded = try? NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: data)
            else {
                return defaultColor
            }
            
            return decoded
        }
        set {
            if let encoded = try? NSKeyedArchiver.archivedData(withRootObject: newValue, requiringSecureCoding: false){
                userDefaults.set(encoded, forKey: key)
            }
        }
    }
}
