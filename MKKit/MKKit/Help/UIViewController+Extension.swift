//
//  UIViewController+Extension.swift
//  MKKit
//
//  Created by 施胡炜 on 2018/7/9.
//  Copyright © 2018年 施胡炜. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    class func initFromSB() -> UIViewController {
        let hasSB: Bool = Bundle.main.path(forResource: self.nameOfClass, ofType: "storyboard") != nil
        guard hasSB else {
            return UIViewController()
        }
        return UIStoryboard.init(name: self.nameOfClass, bundle: nil).instantiateInitialViewController()!
    }
    
    class func initFromNib() -> UIViewController {
        let hasNib: Bool = Bundle.main.path(forResource: self.nameOfClass, ofType: "nib") != nil
        guard hasNib else {
            assert(!hasNib, "Invalid parameter") // here
            return UIViewController()
        }
        return self.init(nibName: self.nameOfClass, bundle: nil)
    }
    
    public static var topViewController: UIViewController? {
        var presentedVC = UIApplication.shared.keyWindow?.rootViewController
        while let pVC = presentedVC?.presentedViewController {
            presentedVC = pVC
        }
        
        if presentedVC == nil {
            print("Error: You don't have any views set. You may be calling them in viewDidLoad. Try viewDidAppear instead.")
        }
        return presentedVC
    }
    
    fileprivate func ts_pushViewController(_ viewController: UIViewController, animated: Bool, hideTabbar: Bool) {
        viewController.hidesBottomBarWhenPushed = hideTabbar
        self.navigationController?.pushViewController(viewController, animated: animated)
    }
    
    /**
     push
     */
    public func ts_pushAndHideTabbar(_ viewController: UIViewController) {
        self.ts_pushViewController(viewController, animated: true, hideTabbar: true)
    }
    
    /**
     present
     */
    public func ts_presentViewController(_ viewController: UIViewController, completion:(() -> Void)?) {
        let navigationController = UINavigationController(rootViewController: viewController)
        self.present(navigationController, animated: true, completion: completion)
    }
    
}
