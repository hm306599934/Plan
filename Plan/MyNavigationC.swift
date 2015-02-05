//
//  MyNavigationC.swift
//  Plan
//
//  Created by Tony on 15/2/1.
//  Copyright (c) 2015年 Jesse. All rights reserved.
//

import Foundation
import UIKit

class MyNavigationC: UINavigationController {
 
    override func viewDidLoad()
    {
        super.viewDidLoad()
        UINavigationBar.appearance().barTintColor = UIColor(red: 47.0/255.0, green: 195.0/255.0, blue: 253.0/255.0, alpha: 1.0)
        //状态栏颜色
        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: false)
        //导航栏返回按钮颜色
        self.navigationBar.tintColor = UIColor.whiteColor()
        //导航栏标题样式
    }

}

