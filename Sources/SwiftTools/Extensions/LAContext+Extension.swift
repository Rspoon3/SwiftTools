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
        @unknown default:
            return .unknown
        }
    }
    
    @available(iOS 14, *)
    var symbol: SFSymbol{
        switch biometricType {
        case .none, .cantEvaluate:
            return .exclamationmark
        case .touchID:
            return .touchid
        case .faceID:
            return .faceid
        case .unknown:
            return .questionmark
        }
    }
    
    @available(iOS 15, *)
    func evaluatePolicy(policy: LAPolicy, localizedReason: String) async throws -> Bool{
        return try await withCheckedThrowingContinuation { continuation in
            evaluatePolicy(policy, localizedReason: localizedReason) { success, error in
                if let error = error{
                    continuation.resume(throwing: error)
                } else{
                    continuation.resume(returning: success)
                }
            }
        }
    }
}
