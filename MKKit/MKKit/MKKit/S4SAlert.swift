//
//  S4SAlert.swift
//  S4SUserClient
//
//  Created by zikong on 16/7/9.
//  Copyright © 2016年 zikong. All rights reserved.
//

import UIKit
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func >= <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l >= r
  default:
    return !(lhs < rhs)
  }
}




class S4SAlert {
    
    class func confirmWithoutCancel(_ title: String?, message: String?, confirmTitle: String, inViewController viewController: UIViewController?, withConfirmAction confirmAction: (() -> Void)?) {
        
        DispatchQueue.main.async {
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
            let confirmAction: UIAlertAction = UIAlertAction(title: confirmTitle, style: .default) { action in
                if let realAction = confirmAction {
                    realAction()
                }
            }
            alertController.addAction(confirmAction)
        
            viewController?.present(alertController, animated: true, completion: nil)
        }
    }
    
    class func confirm(_ title: String, message: String, confirmTitle: String, cancelTitle: String, inViewController viewController: UIViewController?, withConfirmAction confirmAction: @escaping () -> Void) {
        
        DispatchQueue.main.async {
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            let cancelAction: UIAlertAction = UIAlertAction(title: cancelTitle, style: .default, handler: nil)
            alertController.addAction(cancelAction)
            
            let confirmAction: UIAlertAction = UIAlertAction(title: confirmTitle, style: .default) { action in
                confirmAction()
            }
            alertController.addAction(confirmAction)
            
            viewController?.present(alertController, animated: true, completion: nil)
        }
    }
    
    class func confirmOrCancel(_ title: String, message: String, confirmTitle: String, cancelTitle: String, inViewController viewController: UIViewController?, withConfirmAction confirmAction: @escaping () -> Void, cancelAction: @escaping () -> Void) {
        
        DispatchQueue.main.async {
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            let cancelAction: UIAlertAction = UIAlertAction(title: cancelTitle, style: .cancel) { action in
                cancelAction()
            }
            alertController.addAction(cancelAction)
            
            let confirmAction: UIAlertAction = UIAlertAction(title: confirmTitle, style: .default) { action in
                confirmAction()
            }
            alertController.addAction(confirmAction)
            
            viewController?.present(alertController, animated: true, completion: nil)
        }
    }
    
    static weak var confirmAlertAction: UIAlertAction?
    
    class func textInput(_ title: String, message: String?, placeholder: String?, oldText: String?, confirmTitle: String, cancelTitle: String, inViewController viewController: UIViewController?, withConfirmAction confirmAction: ((_ text: String) -> Void)?, cancelAction: (() -> Void)?) {
        
        DispatchQueue.main.async {
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            alertController.addTextField { textField in
                textField.placeholder = placeholder
                textField.text = oldText
                textField.addTarget(self, action: #selector(S4SAlert.handleTextFieldTextDidChangeNotification(_:)), for: .editingChanged)
            }
            
            let _cancelAction: UIAlertAction = UIAlertAction(title: cancelTitle, style: .cancel) { action in
                cancelAction?()
            }
            
            alertController.addAction(_cancelAction)
            
            let _confirmAction: UIAlertAction = UIAlertAction(title: confirmTitle, style: .default) { action in
                if let textField = alertController.textFields?.first, let text = textField.text {
                    
                    confirmAction?(text)
                }
            }
            _confirmAction.isEnabled = false
            self.confirmAlertAction = _confirmAction
            
            alertController.addAction(_confirmAction)
            
            viewController?.present(alertController, animated: true, completion: nil)
        }
    }
    
    @objc class func handleTextFieldTextDidChangeNotification(_ sender: UITextField) {
        
        S4SAlert.confirmAlertAction?.isEnabled = sender.text?.utf16.count >= 1
    }
}
