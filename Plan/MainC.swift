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
    
//    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 20
//    }
//    
//    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
//        return 1
//    }
//    
//    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//        let cellIdentifier: String = "CollectionCellIdentifier"
//        var cell: UICollectionViewCell? = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as? UICollectionViewCell
////        cell.backgroundColor = UIColor(red: 10 * indexPath.row / 255.0, green: 20 * indexPath.row /255.0, blue: 30 * indexPath.row/255.0, alpha: 1.0)
//        
//       
//        return cell!
//    }

}