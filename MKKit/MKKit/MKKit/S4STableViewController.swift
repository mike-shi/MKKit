//
//  S4STableViewController.swift
//  MKKit
//
//  Created by 施胡炜 on 2018/7/9.
//  Copyright © 2018年 施胡炜. All rights reserved.
//

import UIKit

typealias ButtonClickFunc = (UIButton)->Void

@IBDesignable class S4STableViewController: UITableViewController {
    
    var cellHeightAtIndexPath: [IndexPath: CGFloat] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.backgroundColor = UIColor.ViewBackgroundColor()
//        navigationController?.navigationBar.isTranslucent = false
//        navigationController?.navigationBar.setBackgroundImage(UIImage(color: UIColor.primaryBlueColor()), for: .default)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if let height = cellHeightAtIndexPath[indexPath] {
            return height
        }
        return 100
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cellHeightAtIndexPath[indexPath] = cell.frame.height
    }
}


