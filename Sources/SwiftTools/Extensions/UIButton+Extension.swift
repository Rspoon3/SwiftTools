//
//  UIButton+Extension.swift
//  LBTATools
//
//  Created by Brian Voong on 5/1/19.
//

import UIKit

public extension UIButton {
    convenience init(title: String,
                            titleColor: UIColor,
                            font: UIFont = .systemFont(ofSize: 14),
                            backgroundColor: UIColor = .clear,
                            target: Any? = nil,
                            action: Selector? = nil) {
        self.init(type: .system)
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        self.titleLabel?.font = font
        
        self.backgroundColor = backgroundColor
        
        if let action = action {
            addTarget(target, action: action, for: .touchUpInside)
        }
    }
    
    convenience init(image: UIImage, tintColor: UIColor? = nil) {
        self.init(type: .system)
        
        if tintColor == nil {
            setImage(image, for: .normal)
        } else {
            setImage(image.withRenderingMode(.alwaysTemplate), for: .normal)
            self.tintColor = tintColor
        }
    }
}
