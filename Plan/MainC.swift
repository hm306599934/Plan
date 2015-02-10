//
//  MainC.swift
//  Plan
//
//  Created by Tony on 15/1/30.
//  Copyright (c) 2015年 Jesse. All rights reserved.
//
import UIKit
import QuartzCore

class MainC: UIViewController, MenuClickDelegate, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var mTableView: UITableView!
    var delegate: MenuDelegate?
    
    @IBAction func showItem(sender: AnyObject) {
        performSegueWithIdentifier("ShowAddItem", sender: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        menuClickDelegate = self
        let titleView = UIImageView(frame:CGRectMake(0, 0, 95, 32))
        titleView.image = UIImage(named:"icon_ihour")
        self.navigationItem.titleView = titleView
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
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        var cell: MainTableViewCell?  = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? MainTableViewCell
        
        if cell == nil {
            cell = MainTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifier)
        }
        cell?.viewBackground.layer.masksToBounds = true
        cell?.viewBackground.layer.cornerRadius = 5
        
        var gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = CGRectMake(0, 0, 65, 65)
        
        let a = 0xEF563F
        let b = 0xFD876B
        gradient.colors = NSArray(array: [ColorHelper.getCGColorByRGB(b), ColorHelper.getCGColorByRGB(a)])
        
        cell?.viewTime.layer.insertSublayer(gradient, atIndex: 0)
        return cell!
    }

}