//
//  UIImage+Extension.swift
//  Cinematic
//
//  Created by Richard Witherspoon on 4/24/19.
//  Copyright © 2019 Richard Witherspoon. All rights reserved.
//

import UIKit

public extension UIImage {
    func getCropRatio() -> CGFloat{
        let widthRatio = CGFloat(self.size.width / self.size.height)
        return widthRatio
    }
}
