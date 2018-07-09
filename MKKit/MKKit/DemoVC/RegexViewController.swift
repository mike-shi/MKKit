//
//  RegexViewController.swift
//  MKKit
//
//  Created by 施胡炜 on 2018/7/9.
//  Copyright © 2018年 施胡炜. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RegexViewController: UIViewController {

    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var phoneTipLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let phoneObserve = phoneText.rx.text.orEmpty.map{ValidateText(validated: .Phone, validateString: $0)}
        _ = phoneObserve.subscribe(onNext: { (result) in
            self.phoneTipLabel.isHidden = result.isNeedHidden()
            self.phoneTipLabel.text = result.convertToText()
            self.phoneTipLabel.textColor = result.convertToColor()
        })
    }
}
