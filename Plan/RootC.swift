//
//  RootC.swift
//  Plan
//
//  Created by Tony on 15/1/30.
//  Copyright (c) 2015年 Jesse. All rights reserved.
//

import Foundation
import UIKit

public enum MenuState: Int{
    case Opened
    case Closed
}

protocol MenuDelegate{
    func openMenu()
    func closeMenu()
}

var menuStae: MenuState = MenuState.Closed

class RootC: UIViewController, MenuDelegate {
    
    var mainViewController: UINavigationController!
    var leftViewController: UINavigationController!
    var tapRecognizer: UITapGestureRecognizer?
    var panGesture: UIPanGestureRecognizer!
    let openWidth: Int = 80
    let xPoint = UIScreen.mainScreen().bounds.width  - 80
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        mainViewController = storyboard.instantiateViewControllerWithIdentifier("MainViewController") as UINavigationController
        (mainViewController.viewControllers[0] as MainC).delegate = self
        leftViewController = storyboard.instantiateViewControllerWithIdentifier("LeftViewController") as UINavigationController
        (leftViewController.viewControllers[0] as LeftMenuC).delegate = self
        self.view.addSubview(mainViewController.view)
        
        mainViewController.view.frame = self.view.bounds
        mainViewController.view.layer.shadowRadius = 5.0
        mainViewController.view.layer.shadowOpacity = 0.5
        
        self.view.addSubview(leftViewController.view)
        leftViewController.view.frame = self.view.bounds
        self.view.bringSubviewToFront(mainViewController.view)
        
        panGesture = UIPanGestureRecognizer(target: self, action: Selector("pan:"))
        
        self.tapRecognizer = UITapGestureRecognizer(target: self, action: Selector("closeMenu"))
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func pan(panGesture: UIPanGestureRecognizer){
        switch panGesture.state{
        case .Changed:
            var point = panGesture.translationInView(self.view)
            if point.x > 0 || panGesture.view!.center.x > self.view.center.x{
                panGesture.view?.center = CGPointMake(panGesture.view!.center.x + point.x, panGesture.view!.center.y)
                panGesture.setTranslation(CGPointMake(0, 0), inView: self.view)
            }
        case .Ended,.Failed:
            if mainViewController.view.frame.origin.x > self.view.frame.origin.x + 100{
                openMenu()
            }else{
                closeMenu()
            }
        default:
            break
        }
    }
    
    func openMenu() {
        
        self.mainViewController.view.addGestureRecognizer(panGesture)
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationCurve(UIViewAnimationCurve.EaseIn)
        
        mainViewController.view.frame = CGRectMake(xPoint, mainViewController.view.frame.origin.y, mainViewController.view.frame.size.width, mainViewController.view.frame.size.height)
        UIView.commitAnimations()
        menuStae = MenuState.Opened
        mainViewController.view.addGestureRecognizer(self.tapRecognizer!)
    }
    
    func closeMenu() {
        self.mainViewController.view.removeGestureRecognizer(panGesture)
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationCurve(UIViewAnimationCurve.EaseIn)
        mainViewController.view.frame = CGRectMake(0, mainViewController.view.frame.origin.y, mainViewController.view.frame.size.width, mainViewController.view.frame.size.height)
        UIView.commitAnimations()
        menuStae = MenuState.Closed
        mainViewController.view.removeGestureRecognizer(self.tapRecognizer!)
    }

}