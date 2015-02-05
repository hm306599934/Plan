//
//  MainC.swift
//  Plan
//
//  Created by Tony on 15/1/30.
//  Copyright (c) 2015年 Jesse. All rights reserved.
//
import UIKit

class MainC: UIViewController, MenuClickDelegate {
    var delegate: MenuDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuClickDelegate = self
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
    
    func clickMenu() {
        self.performSegueWithIdentifier("ShowDetail", sender: nil)
    }

}