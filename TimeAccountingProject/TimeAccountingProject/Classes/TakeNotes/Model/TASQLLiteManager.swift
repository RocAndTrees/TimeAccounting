//
//  TASQLLiteManager.swift
//  TimeAccountingProject
//
//  Created by pxl on 2017/5/31.
//  Copyright © 2017年 pxl. All rights reserved.
//
 import UIKit
import FMDB




class TASQLLiteManager: NSObject {

    /// 单例
    static let shareInstance: TASQLLiteManager = TASQLLiteManager()
    
    override init() {
        super.init()
        openDB(name: "demo.sqlite")
    }
    
    var db: FMDatabase?
    func openDB(name: String)
    {
        // 1.拼接路径
         let fileURL = try! FileManager.default
            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent(name)

        
        
        // 2.创建数据库对象
        guard let database = FMDatabase(path: fileURL.path) else {
            print("unable to create database")
            return
        }
        
        
        // 3.打开数据库
        // open()特点: 如果数据库文件不存在就创建一个新的, 如果存在就直接打开
        guard database.open() else {
            print("Unable to open database")
            return
        }
        
        // 4.创建表
        if !createTable()
        {
            print("创建数据库失败")
            return
        }
    }
    
    /**
     创建表
     */
    func createTable() ->Bool
    {
        // 1.编写SQL语句
        let sql = "CREATE TABLE IF NOT EXISTS T_Person( \n" +
            "id INTEGER PRIMARY KEY AUTOINCREMENT, \n" +
            "name TEXT, \n" +
            "age INTEGER \n" +
        ");"
        
        // 2.执行SQL语句
        // 注意: 在FMDB中, 除了查询以外的操作都称之为更新
        
        
        return (db?.executeUpdate(sql, withArgumentsIn: nil))!
    }
    
    
}
