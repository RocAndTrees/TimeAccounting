//
//  TakeNotesViewController.swift
//  TimeAccountingProject
//
//  Created by pxl on 2017/5/31.
//  Copyright © 2017年 pxl. All rights reserved.
//

import UIKit

class TakeNotesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


        
        
        
    
    }
    @IBAction func buttonAction(_ sender: Any) {
        self.navigationController?.pushViewController(ChartViewController(), animated: true)
    }
}
