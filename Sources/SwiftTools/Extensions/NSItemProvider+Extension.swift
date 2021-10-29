//
//  NSItemProvider+Extension.swift
//  NSItemProvider+Extension
//
//  Created by Richard Witherspoon on 8/6/21.
//

import Foundation


@available(iOS 15.0.0, *)
public extension NSItemProvider{
    func loadObjectAsync(ofClass type: NSItemProviderReading.Type) async throws -> NSItemProviderReading{
        return try await withCheckedThrowingContinuation { continuation in
            loadObject(ofClass: type) { item, error in
                print("In here")
                if let error = error{
                    print("Error: \(error.localizedDescription)")
                    continuation.resume(throwing: error)
                } else if let item = item{
                    print("Resuming")
                    continuation.resume(returning: item)
                } else {
                    let error = NSError(domain: "Unknown NSItemProviderReading Error", code: -1, userInfo: [:])
                    print("Error 2: \(error.localizedDescription)")
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
