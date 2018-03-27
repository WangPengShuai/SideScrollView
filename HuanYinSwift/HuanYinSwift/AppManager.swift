//
//  AppManager.swift
//  HuanYinSwift
//
//  Created by admin on 2016/12/27.
//  Copyright © 2016年 HuanYin. All rights reserved.
//

import UIKit
import DrawerController

class AppManager: NSObject {
    static let ShareappManager = AppManager()
    public var rootViewController: DrawerController = {
        let leftSideDrawerViewController = SideViewController()
        let centerViewController = HomeViewController()
        
        let navigationController = UINavigationController(rootViewController: centerViewController)
        navigationController.restorationIdentifier = "CenterNavigationControllerRestorationKey"
        
        let leftSideNavController = UINavigationController(rootViewController: leftSideDrawerViewController)
        leftSideNavController.restorationIdentifier = "LeftNavigationControllerRestorationKey"
        
        let drawerController = DrawerController(centerViewController: navigationController, leftDrawerViewController: leftSideNavController)
        drawerController.showsShadows = true
        
        drawerController.restorationIdentifier = "Drawer"
        drawerController.maximumRightDrawerWidth = 200.0
        drawerController.openDrawerGestureModeMask = .all
        drawerController.closeDrawerGestureModeMask = .all
        
        drawerController.drawerVisualStateBlock = { (drawerController, drawerSide, percentVisible) in
            let block = ExampleDrawerVisualStateManager.sharedManager.drawerVisualStateBlock(for: drawerSide)
            block?(drawerController, drawerSide, percentVisible)
        }
        return drawerController
    }()
}


