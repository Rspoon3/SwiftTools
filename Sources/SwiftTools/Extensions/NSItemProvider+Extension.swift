//
//  NSItemProvider+Extension.swift
//  NSItemProvider+Extension
//
//  Created by Richard Witherspoon on 8/6/21.
//

import Foundation


public extension NSItemProvider{
    
    @available(iOS 15.0.0, *)
    func loadObject<T: NSItemProviderReading>(ofClass type: T.Type) async throws -> T{
        return try await withCheckedThrowingContinuation { continuation in
            loadObject(ofClass: type) { (nsItemProviderReading, error) in
                if let error = error{
                    continuation.resume(throwing: error)
                } else if let type = nsItemProviderReading as? T {
                    continuation.resume(returning: type)
                } else {
                    let error = NSError(domain: "Unknown NSItemProviderReading Error", code: -1, userInfo: [:])
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
