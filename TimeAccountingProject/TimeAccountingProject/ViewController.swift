//
//  ViewController.swift
//  TimeAccountingProject
//
//  Created by pxl on 2017/5/24.
//  Copyright © 2017年 pxl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let database: TADatabaseMethod = TADatabaseMethod()
        database.openDatabase()
        
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        self.navigationController?.pushViewController(ChartViewController(), animated: true)
    }
}

