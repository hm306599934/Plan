//
//  LeftMenuC.swift
//  Plan
//
//  Created by Tony on 15/1/30.
//  Copyright (c) 2015年 Jesse. All rights reserved.
//

import UIKit

protocol MenuClickDelegate{
      func clickMenu()
}

var menuClickDelegate: MenuClickDelegate?

class LeftMenuC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var mTableView: UITableView!
    var delegate: MenuDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func viewWillAppear(animated: Bool) {
         self.navigationController?.navigationBar.hidden = true
       
    }
    
    override func viewWillDisappear(animated: Bool) {
         self.navigationController?.navigationBar.hidden = false
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier: String = "LeftMenuCellIdentifier"
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? UITableViewCell
        
        if cell == nil { // no value
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifier)
        }
        
        cell?.textLabel?.text = "123"
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if menuClickDelegate != nil {
            menuClickDelegate?.clickMenu()
        }
    }
    
    
}
