//
//  TANavigationViewController.swift
//  TimeAccountingProject
//
//  Created by pxl on 2017/5/31.
//  Copyright © 2017年 pxl. All rights reserved.
//

import UIKit

class TANavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

    
    
    }
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.childViewControllers.count > 0 {
            //设定LeftButton 样式
            
            
            //设定 push后 BottomBar自动隐藏
            viewController.hidesBottomBarWhenPushed = true
        }
        
        super.pushViewController(viewController, animated: animated)
    }
}
