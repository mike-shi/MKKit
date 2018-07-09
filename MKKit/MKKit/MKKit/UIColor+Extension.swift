//
//  UIColor+Extension.swift
//  MKKit
//
//  Created by 施胡炜 on 2018/7/9.
//  Copyright © 2018年 施胡炜. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience init(hex: Int, alpha: CGFloat = 1) {
        
        let red = CGFloat(((hex & 0xFF0000) >> 16)) / 255.0
        let green = CGFloat(((hex & 0xFF00) >> 8)) / 255.0
        let blue = CGFloat((hex & 0xFF)) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
    }
    
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
    
    public static func ViewBackgroundColor() -> UIColor {
        return UIColor.init(hex: "0xf5f5f5")
    }
    
    public static func primaryBlueColor() -> UIColor {
        return UIColor(red:0.06, green:0.56, blue:0.91, alpha:1.00)
    }
    
    public static func subYellowColor() -> UIColor {
        return UIColor(hex: 0xFF923E)
    }
    
    public static func subCyanColor() -> UIColor {
        return UIColor(hex: 0x86E9F0)
    }
    public static func viewBackgroundColor() -> UIColor {
        return UIColor(hex: 0xF5F5F5)
    }
    
    public static func blueButtonColor() -> UIColor {
        return UIColor(hex: 0x55B5FF)
    }
    
    public static func blueHighlightedButtonColor() -> UIColor {
        return UIColor(hex: 0x4490CC)
    }
    
    public static func yellowButtonColor() -> UIColor {
        return UIColor(hex: 0xFF923E)
    }
    
    public static func yellowHighlightedButtonColor() -> UIColor {
        return UIColor(hex: 0xCC7431)
    }
    
    public static func cyanButtonColor() -> UIColor {
        return UIColor(hex: 0x86E9F0)
    }
    
    public static func cyanHighlightedButtonColor() -> UIColor {
        return UIColor(hex: 0x6BBAC0)
    }
}

