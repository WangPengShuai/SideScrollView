//
//  BaseViewController.swift
//  HuanYinSwift
//
//  Created by admin on 2016/12/27.
//  Copyright © 2016年 HuanYin. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
    }
    func wrapWithNavigationController() -> UINavigationController {
        let nc : UINavigationController = UINavigationController(rootViewController: self)
        return nc
    }
}
