//
//  UIAlertController+Extension.swift
//  
//
//  Created by Richard Witherspoon on 10/19/21.
//

import UIKit

public extension UIAlertController{
    func addActions(_ actions: UIAlertAction...){
        actions.forEach{ addAction($0) }
    }
}
