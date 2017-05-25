//
//  TADatabaseMethod.swift
//  TimeAccountingProject
//
//  Created by pxl on 2017/5/25.
//  Copyright © 2017年 pxl. All rights reserved.
//

import UIKit
import FMDB

class TADatabaseMethod: NSObject {
    
    func openDatabase() {
        let fileURL = try! FileManager.default
            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("TAData.sqlite")
        
        guard let database = FMDatabase(path: fileURL.path) else {
            print("unable to create database")
            return
        }
        
        guard database.open() else {
            print("Unable to open database")
            return
        }
        
        do {
            try database.executeUpdate("create table test(x text, y text, z text)", values: nil)
            try database.executeUpdate("insert into test (x, y, z) values (?, ?, ?)", values: ["a", "b", "c"])
            try database.executeUpdate("insert into test (x, y, z) values (?, ?, ?)", values: ["e", "f", "g"])
            
            let rs = try database.executeQuery("select x, y, z from test", values: nil)
            while rs.next() {
                if let x = rs.string(forColumn: "x"), let y = rs.string(forColumn: "y"), let z = rs.string(forColumn: "z") {
                    print("x = \(x); y = \(y); z = \(z)")
                }
            }
        } catch {
            print("failed: \(error.localizedDescription)")
        }
        
//        database.close()
        
    }
}
