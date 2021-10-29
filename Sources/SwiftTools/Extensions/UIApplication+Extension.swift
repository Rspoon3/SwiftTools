//
//  UIApplication+Extension.swift
//  NYAB Field Service
//
//  Created by Richard Witherspoon on 3/23/20.
//  Copyright © 2020 Richard Witherspoon. All rights reserved.
//

import UIKit
import StoreKit

public extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    @available(iOS 14.0, *)
    func requestReview(delay: Int?){
        #if DEBUG
        return
        #else
        guard let scene =  connectedScenes
                .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene else { return }
        
        if let delay = delay{
            if delay == 0{
                SKStoreReviewController.requestReview(in: scene)
            } else {
                let after = DispatchTimeInterval.seconds(delay)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + after){
                    SKStoreReviewController.requestReview(in: scene)
                }
            }
        } else {
            SKStoreReviewController.requestReview(in: scene)
        }
        #endif
    }
}
