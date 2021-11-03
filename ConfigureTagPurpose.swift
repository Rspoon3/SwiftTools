//
//  ConfigureTagPurpose.swift
//  Study Sets
//
//  Created by Richard Witherspoon on 11/3/21.
//  Copyright © 2021 Richard Witherspoon. All rights reserved.
//

import Foundation


enum ConfigureTagPurpose{
    case edit(_ tag: Tag)
    case createTag
    
    var title: String{
        switch self {
        case .edit(let tag):
            return "Edit \(tag.title)"
        case .createTag:
            return "Create Tag"
        }
    }
}
