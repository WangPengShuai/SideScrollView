//
//  HomeViewController.swift
//  HuanYinSwift
//
//  Created by admin on 2016/12/27.
//  Copyright © 2016年 HuanYin. All rights reserved.
//

import UIKit
import DrawerController

class HomeViewController: BaseViewController {
    
    var scrollView : UIScrollView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension HomeViewController{
    func setupUI(){
        self.edgesForExtendedLayout = UIRectEdge.top
        scrollView = UIScrollView(frame: CGRect(x: 0, y: -20, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 20))
        scrollView?.isPagingEnabled = true
        scrollView?.bounces = false
        if #available(iOS 11.0, *) {
            scrollView?.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false;
        };
        scrollView?.contentSize = CGSize(width: UIScreen.main.bounds.width * 3, height: UIScreen.main.bounds.height)
        if let scrollView = scrollView {
            self.view.addSubview(scrollView)
        }
        scrollView?.panGestureRecognizer.addTarget(self, action: #selector(transferPanGesture))
        configVC(vc: RecommendViewController(), index: 0)
        configVC(vc: StyleViewController(), index: 1)
        
        let leftDrawerButton = DrawerBarButtonItem(title: "left", style: UIBarButtonItemStyle.done, target: self, action: #selector(leftDrawerButtonPress(_:)))
        self.navigationItem.setLeftBarButton(leftDrawerButton, animated: true)
    }
    
    func configVC(vc: BaseViewController,index: Int){
        let nc = vc.wrapWithNavigationController()
        self.addChildViewController(nc)
        nc.view.frame = CGRect(x: CGFloat(CGFloat(index) * UIScreen.main.bounds.width), y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        scrollView?.addSubview(nc.view)
    }
    
    func leftDrawerButtonPress(_ sender: AnyObject?) {
        self.evo_drawerController?.toggleDrawerSide(.left, animated: true, completion: nil)
    }
    func transferPanGesture(gesture : UIPanGestureRecognizer){
        if (gesture.state == UIGestureRecognizerState.cancelled || gesture.state == UIGestureRecognizerState.ended) {
            if scrollView?.contentOffset.x == CGFloat(0) {
                leftDrawerButtonPress(gesture)
            }
        }
    }
}
