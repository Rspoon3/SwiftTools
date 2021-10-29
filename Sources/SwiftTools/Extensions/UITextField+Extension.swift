//
//  UITextField+Extension.swift
//  LBTATools
//
//  Created by Brian Voong on 5/7/19.
//

import UIKit
import Combine

public extension UITextField {

    convenience init(placeholder: String) {
        self.init()
        self.placeholder = placeholder
    }
    
    var textPublisher: AnyPublisher<String, Never> {
        NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: self)
            .compactMap { $0.object as? UITextField }
            .map { $0.text ?? "" }
            .eraseToAnyPublisher()
    }
}
