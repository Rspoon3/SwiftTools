//
//  String+Extension.swift
//  
//
//  Created by Richard Witherspoon on 1/21/21.
//

import Foundation


public extension String{
    func replacingFirstOccurrence(of target: String, with replaceString: String) -> String{
        if let range = self.range(of: target) {
            return self.replacingCharacters(in: range, with: replaceString)
        }
        return self
    }
    
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
