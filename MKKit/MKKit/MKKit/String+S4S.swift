//
//  String.swift
//  S4SFinancialClient
//
//  Created by zikong on 2017/5/16.
//  Copyright © 2017年 zikong. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func length() -> Int {
        return self.characters.count
    }
    
    func translateToTraditionalChinese() -> String? {
        
        guard let _ = Double(self) else {
            return nil
        }
        
        return ""
    }
    
    func transformToDouble() -> Double {
        return NSString(string: self).doubleValue
    }
    
    func getTextHeigh(textStr:String,font:UIFont,width:CGFloat) -> CGFloat {
        
        let normalText: NSString = textStr as NSString
        let size = CGSize.init(width: width, height: 1000)
        let dic = NSDictionary(object: font, forKey: kCTFontAttributeName as! NSCopying)
        let stringSize = normalText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [NSAttributedStringKey : AnyObject], context:nil).size
        return stringSize.height
    }
    
    func getTextWidth(textStr:String,font:UIFont,height:CGFloat) -> CGFloat {
        
        let normalText: NSString = textStr as NSString
        
        let size = CGSize.init(width: 1000, height: height)
        
        let dic = NSDictionary(object: font, forKey: kCTFontAttributeName as! NSCopying)
        
        let stringSize = normalText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [NSAttributedStringKey : AnyObject], context:nil).size
        
        return stringSize.width
        
    }
    
    
    func base64StringToUIImage() -> UIImage? {
        var str = self
        
        // 1、判断用户传过来的base64的字符串是否是以data开口的，如果是以data开头的，那么就获取字符串中的base代码，然后在转换，如果不是以data开头的，那么就直接转换
        if str.hasPrefix("data:image") {
            guard let newBase64String = str.components(separatedBy: ",").last else {
                return nil
            }
            str = newBase64String
        }
        // 2、将处理好的base64String代码转换成NSData
        guard let imgNSData = NSData(base64Encoded: str, options: NSData.Base64DecodingOptions()) else {
            return nil
        }
        // 3、将NSData的图片，转换成UIImage
        guard let codeImage = UIImage(data: imgNSData as Data) else {
            return nil
        }
        return codeImage
    }
    
    
//    func calculateTime(secondTime:Date) -> String {
//        
//        let dateFormat: DateFormatter = DateFormatter()
//        dateFormat.locale = Locale.current
//        dateFormat.dateFormat = "yyyy-mm-dd HH:mm:ss"
//        dateFormat.timeZone = NSTimeZone.init(forSecondsFromGMT: 8) as TimeZone!
//        let create = dateFormat.date(from: self)
//        let calendar = Calendar.current
//        let createDate = calendar.date(byAdding: 8.month, to: create!)
//        
//        let diffComponents = calendar.dateComponents([Calendar.Component.year,Calendar.Component.month,Calendar.Component.day,Calendar.Component.hour,Calendar.Component.minute], from: createDate!, to: secondTime)
//        
//        if diffComponents.year != 0{
//            return "\(diffComponents.year ?? 0)年前"
//        }else if diffComponents.month != 0{
//            return "\(diffComponents.month ?? 0)个月前"
//        }else if diffComponents.day != 0{
//            return "\(diffComponents.day ?? 0)天前"
//        }else if diffComponents.hour != 0{
//            return "\(diffComponents.hour ?? 0)小时前"
//        }else if diffComponents.minute != 0{
//            return "\(diffComponents.minute ?? 0)分钟前"
//        }else{
//            return "1分钟前"
//        }
//    }
}
