//
//  iCloudKeyValueStore.swift
//  Cinematic
//
//  Created by Richard Witherspoon on 4/18/20.
//  Copyright © 2020 Richard Witherspoon. All rights reserved.
//

import Foundation

@propertyWrapper
public struct iCloudKeyValueStore<T> {
    private var key: String
    private var defaultValue: T
    private var store: NSUbiquitousKeyValueStore
    
    public init(wrappedValue value: T, key: String, store: NSUbiquitousKeyValueStore = .default) {
        self.key = key
        self.defaultValue = value
        self.store = store
    }
    
    public var wrappedValue: T {
        get {
            return store.object(forKey: key) as? T ?? defaultValue
        }
        set {
            store.set(newValue, forKey: key)
            store.synchronize()
        }
    }
}
