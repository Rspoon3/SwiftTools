//
//  LAContext+Extension.swift
//  EZMaxRequest
//
//  Created by Richard Witherspoon on 9/22/20.
//  Copyright © 2020 InterPro Solutions, LLC. All rights reserved.
//

import Foundation
import LocalAuthentication
import SFSymbols

public extension LAContext {
    enum BiometricType: String {
        case none
        case touchID = "Touch ID"
        case faceID  = "Face ID"
        case opticID = "Optic ID"
        case unknown
        case cantEvaluate
    }
    
    var biometricType: BiometricType {
        
        guard self.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) else {
            return .cantEvaluate
        }
        
        switch self.biometryType {
        case .none:
            return .none
        case .touchID:
            return .touchID
        case .faceID:
            return .faceID
        case .opticID:
            return .opticID
        @unknown default:
            return .unknown
        }
    }
    
    var symbol: SFSymbol {
        switch biometricType {
        case .none, .cantEvaluate:
            return .exclamationmark
        case .touchID:
            if #available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, visionOS 1.0, *) {
                return .touchid
            } else {
                return .handDraw
            }
        case .faceID:
            return .faceid
        case .opticID:
            if #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *) {
                return .opticid
            } else {
                return .eye
            }
        case .unknown:
            return .questionmark
        }
    }
}
