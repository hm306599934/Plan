//
//  MainC.swift
//  Plan
//
//  Created by Tony on 15/1/30.
//  Copyright (c) 2015年 Jesse. All rights reserved.
//
import UIKit

class MainC: UIViewController {
    var delegate: MenuDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initNavigation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func menuOperate(sender: AnyObject) {
        if menuStae == MenuState.Closed{
            delegate?.openMenu()
        }else{
            delegate?.closeMenu()
        }
    }
    
    func initNavigation(){
    //导航栏背景
    UINavigationBar.appearance().barTintColor = UIColor(red: 33.0/255.0, green: 168.0/255.0, blue: 233.0/255.0, alpha: 0.9)
    //状态栏颜色
    UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: false)
    //导航栏返回按钮颜色
    //self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
    //导航栏标题样式
//    self.navigationController?.navigationBar.titleTextAttributes = NSDictionary.dictionaryWithValuesForKeys(<#keys: [AnyObject]#>)
//        
//        NSDictionary.dictionaryWithValuesForKeys(UIColor.whiteColor(), NSForegroundColorAttributeName,UIFont.boldSystemFontOfSize(20.0), NSFontAttributeName,nil)
    }
}