//
//  JSONDecoder+Extension.swift
//  Cinematic
//
//  Created by Richard Witherspoon on 8/17/20.
//  Copyright © 2020 Richard Witherspoon. All rights reserved.
//

import Foundation


public extension JSONDecoder{
    convenience init(_ keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy) {
        self.init()
        self.keyDecodingStrategy = keyDecodingStrategy
    }
}
