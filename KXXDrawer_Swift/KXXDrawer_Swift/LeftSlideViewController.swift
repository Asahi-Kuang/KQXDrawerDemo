//
//  LeftSlideViewController.swift
//  KXXDrawer_Swift
//
//  Created by Kxx.xxQ 一生相伴 on 15/12/4.
//  Copyright © 2015年 asahi_kuang. All rights reserved.
//

import UIKit

class LeftSlideViewController: UIViewController {
    var leftVC   : UIViewController?
    var mainVC   : UIViewController?
    var isOpened : Bool?
    var tableView: UITableView?
    var tableViewCenter: CGPoint?
    var userIcon : UIImageView?
    
    // 构造方法，注意父类构造
    init(leftVC: UIViewController, mainVC: UIViewController) {
        self.leftVC = leftVC
        self.mainVC = mainVC
        
        super.init(nibName: nil, bundle: nil)
        
        
        
        for view in (self.leftVC?.view.subviews)! {
            if (view.isKindOfClass(UITableView.classForCoder()) == true) {
                self.tableView = (view as! UITableView)
            }
        }
        
        for imgView in (self.leftVC?.view.subviews)! {
            for icon in imgView.subviews {
                if icon.tag == 1991 {
                    self.userIcon = (icon as! UIImageView)
                }
            }
        }
        
        
        self.userIcon?.frame        = CGRectMake(75, 55, 100, 100)
        self.userIcon?.transform    = CGAffineTransformMakeScale(0.1, 0.1)

        self.tableView?.frame = CGRectMake(0, 180,CGRectGetWidth(self.view.frame) - CGRectGetWidth(self.view.frame)/2 + 65, CGRectGetHeight(self.view.frame) - 150)
        self.tableViewCenter = self.tableView?.center
        self.tableView?.transform = CGAffineTransformMakeScale(0.1, 0.1)
        self.tableView?.center = CGPointMake(-CGRectGetWidth((self.tableView?.frame)!), CGRectGetMinY((self.tableView?.frame)!))
        self.tableView?.transform   = CGAffineTransformMakeScale(0.1, 0.1)
        
        // 把两个控制器的视图添加上去
        self.view.addSubview(self.leftVC!.view)
        self.view.addSubview(self.mainVC!.view)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.createUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Create UI
    func createUI() {
        self.view.backgroundColor = UIColor.whiteColor()
        isOpened = false
    }
    // MARK: - Mothods
    func openLeftSlideViewController() {
        print("opened...");
        self.view.addSubview(self.leftVC!.view)
        self.view.addSubview(self.mainVC!.view)

        UIView.animateWithDuration(0.8, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.6, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
            //
            self.mainVC?.view.transform = CGAffineTransformMakeScale(0.65, 0.65)
            self.mainVC?.view.center    = CGPointMake(CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)/2)
            
            self.tableView?.transform   = CGAffineTransformMakeScale(1, 1)
            self.tableView?.center      = self.tableViewCenter!
            
            self.userIcon?.transform    = CGAffineTransformMakeScale(1, 1)
            
            }) { (Bool) -> Void in
                //
                self.isOpened = true
        }
    }
    
    func closeLeftSlideViewController() {
        print("closed...");
        UIView.animateWithDuration(0.8, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.6, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
            //
            self.mainVC?.view.transform = CGAffineTransformMakeScale(1, 1)
            self.mainVC?.view.center    = CGPointMake(CGRectGetWidth(self.view.frame)/2, CGRectGetHeight(self.view.frame)/2)
            
            self.tableView?.transform = CGAffineTransformMakeScale(0.1, 0.1)
            self.tableView?.center = CGPointMake(-CGRectGetWidth((self.tableView?.frame)!), CGRectGetMinY((self.tableView?.frame)!))
            
            self.userIcon?.transform    = CGAffineTransformMakeScale(0.1, 0.1)

            }) { (Bool) -> Void in
                //
                self.leftVC?.view.removeFromSuperview()
                self.isOpened = false
        }
    }

}
