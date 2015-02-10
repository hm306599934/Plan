//
//  ClickDetail.swift
//  Plan
//
//  Created by Tony on 15/2/5.
//  Copyright (c) 2015年 Jesse. All rights reserved.
//

import UIKit

class AddItemC: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource{
    
    var collectionCount = 20
    var cellHeight: CGFloat = 230
    
    @IBOutlet weak var mTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 3 {
            return 2
        }else{
            return 1
        }
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 3 && indexPath.row == 0{
            return cellHeight
        }else{
            return 50
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            let cellIdentifier: String = "AddItemTitleTableViewCell"
            var cell: AddItemTitleTableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? AddItemTitleTableViewCell
            
            if cell == nil { // no value
                cell = AddItemTitleTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifier)
            }
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
            return cell!
        case 1:
            let cellIdentifier: String = "AddItemTimeTableViewCell"
            var cell: AddItemTimeTableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? AddItemTimeTableViewCell
            
            if cell == nil { // no value
                cell = AddItemTimeTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifier)
            }
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
            return cell!
        case 2:
            let cellIdentifier: String = "AddItemRemindTableViewCell"
            var cell: AddItemRemindTableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? AddItemRemindTableViewCell
            
            if cell == nil { // no value
                cell = AddItemRemindTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifier)
            }
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
            return cell!
        case 3:
            if indexPath.row == 0{
                let cellIdentifier: String = "AddItemIconTableViewCell"
                var cell: AddItemIconTableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? AddItemIconTableViewCell
                
                if cell == nil { // no value
                    cell = AddItemIconTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifier)
                }
                cell?.selectionStyle = UITableViewCellSelectionStyle.None
                return cell!
            }else{
                let cellIdentifier: String = "AddItemIconMoreTableViewCell"
                var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? UITableViewCell
                
                if cell == nil { // no value
                    cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifier)
                }
                cell?.selectionStyle = UITableViewCellSelectionStyle.Default
                return cell!
            }
        default:
            var cell: UITableViewCell!
            return cell
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if indexPath.section == 3 && indexPath.row == 1{
           collectionCount = 40
           cellHeight = 430
           var collectionViewCell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 3)) as AddItemIconTableViewCell
           
           tableView.reloadRowsAtIndexPaths([NSIndexPath(forRow: 0, inSection: 3)], withRowAnimation: UITableViewRowAnimation.Automatic)
           collectionViewCell.mCollectionView.reloadData()
        }
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionCount
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
            return CGSize(width: 50, height: 50)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat{
            return 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cellIdentifier: String = "AddItemCollectionViewCell"
        var cell: AddItemCollectionViewCell? = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as? AddItemCollectionViewCell
        
        let apperenceInfoPath = NSBundle.mainBundle().pathForResource("Apperence", ofType: "plist")
        var apperenceInfo: NSMutableDictionary = NSMutableDictionary(contentsOfFile: apperenceInfoPath!)!
        if apperenceInfo.objectForKey("0064") != nil {
            var a = apperenceInfo.objectForKey("0064")?.objectForKey("IconName") as String
            
            NSLog(a)
        }
        cell?.imgIcon.image = UIImage(named: "EA_0003")
        return cell!
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
         var cell: AddItemCollectionViewCell? = collectionView.cellForItemAtIndexPath(indexPath) as? AddItemCollectionViewCell
        cell?.imgBackground.hidden = false
        
    }
}