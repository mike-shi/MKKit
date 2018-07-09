//
//  Validate.swift
//  GATest
//
//  Created by mike on 2018/5/15.
//  Copyright © 2018年 mike. All rights reserved.
//

import Foundation
import UIKit

enum ValidateResult {
    case correct
    case error
    case normal
    
    func convertToText() -> String {
        switch self {
        case .normal:
            return ""
        case .error:
            return "error phone Num"
        case .correct:
            return "correct phone Num"
        }
    }
    
    func convertToColor() -> UIColor {
        switch self {
        case .normal:
            return UIColor.black
        case .correct:
            return UIColor.green
        case .error:
            return UIColor.red
        }
    }
    
    func isNeedHidden() -> Bool {
        switch self {
        case .normal:
            return true
        default:
            return false
        }
    }
}

enum ValidatedType {
    case Phone
    case Email
    
    func convertToPattern () -> String {
        switch self {
        case .Phone:
            return "^1[0-9]{10}$"
        case .Email:
            return "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
        }
    }
}

func ValidateText(validated: ValidatedType, validateString: String) -> ValidateResult {
    if validateString.length() < 8 {
        return .normal
    }
    let pattern = validated.convertToPattern()
    return validateString =~ pattern ? .correct : .error
}



