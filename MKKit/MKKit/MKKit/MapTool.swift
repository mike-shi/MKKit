//
//  MapTool.swift
//  CheBaobao
//
//  Created by 施胡炜 on 2018/5/3.
//  Copyright © 2018年 zjueman. All rights reserved.
//

import UIKit
import MapKit

class MapTool: NSObject {

    static func directToMap(point: CLLocationCoordinate2D, address: String) {
        let actionSheet = UIAlertController.init(title: "导航到设备", message: nil, preferredStyle: .actionSheet)
        
        let sheet1 = UIAlertAction.init(title: "苹果地图", style: .default) { (alert) in
            let item = MKMapItem.forCurrentLocation()
            let toLocation = MKMapItem.init(placemark: MKPlacemark.init(coordinate: point, addressDictionary: nil))
            MKMapItem.openMaps(with: [item, toLocation], launchOptions: [MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeWalking])
        }
        actionSheet.addAction(sheet1)
        
        if UIApplication.shared.canOpenURL(URL.init(string: "iosamap://")!) {
            let sheet2 = UIAlertAction.init(title: "高德地图", style: .default) { (alert) in
                let urlsting = "iosamap://navi?sourceApplication=&backScheme=&lat=\(point.latitude)&lon=\(point.longitude)&dev=0&style="
                let encodeStr = NSString.init(string: urlsting).addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
                UIApplication.shared.openURL(URL.init(string: encodeStr!)!)
            }
            actionSheet.addAction(sheet2)
        }
        
        if UIApplication.shared.canOpenURL(URL.init(string: "baidumap://")!) {
            let sheet3 = UIAlertAction.init(title: "百度地图", style: .default) { (alert) in
                let urlsting = "baidumap://map/direction?origin={{我的位置}}&destination=latlng:\(point.latitude),\(point.longitude)|name=目的地&mode=driving&coord_type=gcj02"
                let encodeStr = NSString.init(string: urlsting).addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
                UIApplication.shared.openURL(URL.init(string: encodeStr!)!)
            }
            actionSheet.addAction(sheet3)
        }
        
        let cancle = UIAlertAction.init(title: "取消", style: .cancel, handler: nil)
        actionSheet.addAction(cancle)
        let currentVC = UIApplication.shared.keyWindow?.rootViewController?.getCurrentVC()
        currentVC?.present(actionSheet, animated: true, completion: nil)
    }
    
}
