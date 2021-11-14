//
//  UIColor+Extension.swift
//  
//
//  Created by Richard Witherspoon on 1/21/21.
//

import UIKit


public extension UIColor {
    ///Example: static let messageSender = UIColor(hex: "#508392ff")
    ///Last two values represent an alpha value
    convenience init(hex: String){
        var hex = hex
        
        if hex.hasPrefix("#") {
            hex = String(hex.dropFirst())
        }
        
        if hex.count == 6{
            hex.append("ff")
        }
        
        let scanner = Scanner(string: hex)
        var hexNumber: UInt64 = 0
        
        scanner.scanHexInt64(&hexNumber)
        
        let r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
        let g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
        let b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
        let a = CGFloat(hexNumber & 0x000000ff) / 255
        
        self.init(red: r, green: g, blue: b, alpha: a)
    }
    
    func lighter(by percentage: CGFloat = 30.0) -> UIColor {
        return self.adjust(by: abs(percentage) )
    }

    func darker(by percentage: CGFloat = 30.0) -> UIColor {
        return self.adjust(by: -1 * abs(percentage) )
    }
    
    func toData() -> Data {
        return try! NSKeyedArchiver.archivedData(withRootObject: self, requiringSecureCoding: false)
    }
    
    static func random(alpha: CGFloat = 1.0)->UIColor{
        let r = CGFloat.random(in: 0...1)
        let g = CGFloat.random(in: 0...1)
        let b = CGFloat.random(in: 0...1)
        
        return UIColor(red: r, green: g, blue: b, alpha: alpha)
    }
    
    static func fromData(_ data:Data) -> UIColor {
        return try! NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: data)!
    }
    
    
    //MARK: - Helpers
    private func adjust(by percentage: CGFloat = 30.0) -> UIColor {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return UIColor(red: min(red + percentage/100, 1.0),
                           green: min(green + percentage/100, 1.0),
                           blue: min(blue + percentage/100, 1.0),
                           alpha: alpha)
        } else {
            return self
        }
    }
}
