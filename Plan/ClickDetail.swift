//
//  ClickDetail.swift
//  Plan
//
//  Created by Tony on 15/2/5.
//  Copyright (c) 2015年 Jesse. All rights reserved.
//

import UIKit

class ClickDetail: UIViewController {
    var delegate: MenuDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = UIApplication.sharedApplication().keyWindow?.rootViewController as RootC
    }
    
    override func viewWillAppear(animated: Bool) {
        
        if delegate != nil {
             delegate?.closeMenu()
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        if delegate != nil {
            delegate?.openMenu()
        }
    }
}