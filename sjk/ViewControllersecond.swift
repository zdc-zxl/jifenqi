//
//  ViewControllersecond.swift
//  sjk
//
//  Created by dllm on 16/5/9.
//  Copyright © 2016年 zdc. All rights reserved.
//

import UIKit

class ViewControllersecond: UIViewController {
    var db:SQLiteDB!

    override func viewDidLoad() {
        super.viewDidLoad()
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists t_cound(uid integer primary key,fance varchar(20))")
        //如果有数据则加载
        initUser()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        saveUser()
    }
    
    @IBOutlet weak var reed: UITextField!

    @IBOutlet weak var write: UITextField!
    func initUser() {
        let data = db.query("select * from t_cound")
        if data.count > 0 {
            //获取最后一行数据显示
            let user = data[data.count - 1]
            write.text = user["fance"] as? String
            //txtMobile.text = user["mobile"] as? String
        }
    }
    func saveUser() {
        let fance = self.reed.text!
        //插入数据库，这里用到了esc字符编码函数，其实是调用bridge.m实现的
        let sql = "insert into t_cound(fance) values('\(fance)')"
        print("sql: \(sql)")
        //通过封装的方法执行sql
        let result = db.execute(sql)
        print(result)
    }
    @IBAction func du(sender: AnyObject) {
        //插入数据库，这里用到了esc字符编码函数，其实是调用bridge.m实现的
        let fance = self.reed.text!
        let sql = "insert into t_cound(fance) values('\(fance)')"
        print("sql: \(sql)")
        //通过封装的方法执行sql
        let result = db.execute(sql)
        print(result)

    }

    @IBAction func xie(sender: AnyObject) {
        let data = db.query("select * from t_cound")
        if data.count > 0 {
            //获取最后一行数据显示
            let user = data[data.count - 1]
            write.text = user["fance"] as? String
           
        }

    }
    @IBOutlet weak var redf: UILabel!//红方得分
    @IBOutlet weak var bluef: UILabel!
    //蓝方得分
    @IBOutlet weak var redwin: UILabel!
    @IBOutlet weak var bluewin: UILabel!
    var a=0;
    var b=0;
    var a1=0;
    var b1=0;
    @IBAction func redbutton(sender: AnyObject) {
        a++
        if(a<11)
        {
            redf.text!="\(a)"
        }
        else if(a==11)
        {
            a1++
            redf.text!="\(a)"
            //redf.text!=""
            redwin.text!="\(a1)"
            
        }
        else
        {
           a=0;
            redf.text!=""
        }
        
    }
    
    @IBAction func bluef(sender: AnyObject) {
        b++
       // bluef.text!="\(b)"
        
        if(b<11)
        {
            bluef.text!="\(b)"
        }
        else if(b==11)
        {
            b1++
            bluef.text!="\(b)"
            //redf.text!=""
            bluewin.text!="\(b1)"
            
        }
        else
        {
            b=0;
            bluef.text!=""
        }
        

    }
    @IBAction func clean(sender: AnyObject) {
        a=0;
        redf.text!=""

        b=0;
        bluef.text!=""
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
