//
//  UIColor+S4S.swift
//  S4SFinancialClient
//
//  Created by zikong on 2016/11/21.
//  Copyright © 2016年 zikong. All rights reserved.
//

import Foundation


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
    
    static func colorWithHex(_ rgbValue: Int) -> UIColor {
        return UIColor(colorLiteralRed: Float(((rgbValue & 0xFF0000) >> 16)) / 255.0, green: Float(((rgbValue & 0xFF00) >> 8)) / 255.0, blue: Float((rgbValue & 0xFF)) / 255.0, alpha: 1.0)
    }
    

    static func hexStringToColor(hexString: String) -> UIColor{
        
        var cString = hexString.trimmingCharacters(in:CharacterSet.whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            let index = cString.index(cString.startIndex, offsetBy:1)
            cString = cString.substring(from: index)
        }
        
        if (cString.characters.count != 6) {
            return UIColor.red
        }
        
        let rIndex = cString.index(cString.startIndex, offsetBy: 2)
        let rString = cString.substring(to: rIndex)
        let otherString = cString.substring(from: rIndex)
        let gIndex = otherString.index(otherString.startIndex, offsetBy: 2)
        let gString = otherString.substring(to: gIndex)
        let bIndex = cString.index(cString.endIndex, offsetBy: -2)
        let bString = cString.substring(from: bIndex)
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
        
    }
    
    public static func ViewBackgroundColor() -> UIColor {
        return UIColor.colorWithHex(0xf5f5f5)
    }
    
    public static func ButtonSelectColor() -> UIColor {
        return UIColor.colorWithHex(0x349a68)
    }
    
    public static func ThemeGreenColor() -> UIColor {
        return UIColor.colorWithHex(0x37d083)
    }
    
    public static func S4SCarCareColor() -> UIColor {
        return UIColor.colorWithHex(0xF8CE05)
    }
    public static func S4SCarDetectColor() -> UIColor {
        return UIColor.colorWithHex(0x7ED321)
    }
    public static func S4SCarLookColor() -> UIColor {
        return UIColor.colorWithHex(0x6FBC97)
    }
    
    public static func S4SPrimaryColor() -> UIColor {
        return UIColor.colorWithHex(0xEC5B2F)
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

