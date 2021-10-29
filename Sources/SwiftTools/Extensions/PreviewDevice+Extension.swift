//
//  PreviewDevice+Extension.swift
//  InterProToolsPreview
//
//  Created by Richard Witherspoon on 1/21/21.
//

import SwiftUI


extension PreviewDevice: Hashable, Identifiable{
    public var id: String{
        rawValue
    }
    
    //MARK: - iPhones
    public static let iPhoneSE       = PreviewDevice(rawValue: "iPhone SE (2nd generation)")
    public static let iPhone8        = PreviewDevice(rawValue: "iPhone 8")
    public static let iPhone8Plus    = PreviewDevice(rawValue: "iPhone 8 Plus")
    public static let iPhoneX        = PreviewDevice(rawValue: "iPhone X")
    public static let iPhone11       = PreviewDevice(rawValue: "iPhone 11")
    public static let iPhone11Pro    = PreviewDevice(rawValue: "iPhone 11 Pro")
    public static let iPhone11ProMax = PreviewDevice(rawValue: "iPhone 11 Pro Max")
    public static let iPhone12       = PreviewDevice(rawValue: "iPhone 12")
    public static let iPhone12Pro    = PreviewDevice(rawValue: "iPhone 12 Pro")
    public static let iPhone12ProMax = PreviewDevice(rawValue: "iPhone 12 Pro Max")
    public static let iPhone12Mini   = PreviewDevice(rawValue: "iPhone 12 mini")
    public static let iPhone13       = PreviewDevice(rawValue: "iPhone 13")
    public static let iPhone13Pro    = PreviewDevice(rawValue: "iPhone 13 Pro")
    public static let iPhone13ProMax = PreviewDevice(rawValue: "iPhone 13 Pro Max")
    public static let iPhone13Mini   = PreviewDevice(rawValue: "iPhone 13 mini")
    
    //MARK: - iPod Touch
    public static let iPodTouch = PreviewDevice(rawValue: "iPod Touch (7th generation)")
    
    //MARK: - iPad
    public static let iPad     = PreviewDevice(rawValue: "iPad (9th generation)")
    public static let iPadMini = PreviewDevice(rawValue: "iPad Mini (6th generation)")
    public static let iPadAir  = PreviewDevice(rawValue: "iPad Air (4th generation)")
    public static let iPadPro  = PreviewDevice(rawValue: "iPad Pro (9.7-inch)")
    public static let iPad11   = PreviewDevice(rawValue: "iPad Pro (11-inch) (3rd generation)")
    public static let iPad12p9 = PreviewDevice(rawValue: "iPad Pro (12.9-inch) (5th generation)")
}

