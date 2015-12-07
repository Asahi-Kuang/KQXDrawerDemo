//
//  MainViewController.swift
//  KXXDrawer_Swift
//
//  Created by Kxx.xxQ 一生相伴 on 15/12/4.
//  Copyright © 2015年 asahi_kuang. All rights reserved.
//

import UIKit

let reuseIdentifier = "reuseIdentifier"
class MainViewController: UIViewController, UITableViewDelegate {

    var tableView: UITableView?
    var dataSource: ArrayDataSource?
    var dataArray: Array<AnyObject>?
    var swipe: UISwipeGestureRecognizer?
    // mark: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.createUI()
        self.setUpTableView()
        // 注册cell
        self.tableView?.registerNib(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView!.userInteractionEnabled = true
        self.swipe!.direction = UISwipeGestureRecognizerDirection.Right
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Create UI
    func createUI() {
        self.view.backgroundColor = UIColor.whiteColor()
        var leftBarBtn: UIButton?
        leftBarBtn = UIButton(type: UIButtonType.Custom)
        leftBarBtn!.frame = CGRectMake(0, 0, 40, 40)
        leftBarBtn!.setImage(UIImage.init(imageLiteral: "leftBar"), forState: UIControlState.Normal)
        leftBarBtn!.addTarget(self, action: Selector.init(stringLiteral: "leftBarBtnPressed"), forControlEvents: UIControlEvents.TouchUpInside)
        self.navigationItem.setLeftBarButtonItem(UIBarButtonItem.init(customView: leftBarBtn!), animated: false)
        
        let navTitleLb = UILabel(frame: CGRectMake(0, 0, 100 ,40))
        navTitleLb.text = "iOS Drawer_Swift"
        navTitleLb.textAlignment = NSTextAlignment.Center
        navTitleLb.textColor = UIColor.whiteColor()
        navTitleLb.font = UIFont.boldSystemFontOfSize(20)
        self.navigationItem.titleView = navTitleLb
        self.navigationController?.navigationBar.barTintColor = UIColor(colorLiteralRed: 204/255.0, green: 0/255.0, blue: 51/255.0, alpha: 1)
        
        // 手势
        self.swipe = UISwipeGestureRecognizer(target: self, action: Selector.init("leftBarBtnPressed"))
        self.view.addGestureRecognizer(self.swipe!)
    }
    // MARK: - setUpTableView
    func setUpTableView() {

        self.tableView = UITableView(frame: self.view.frame, style: UITableViewStyle.Plain)
        let tbView = UIView.init()
        self.tableView?.tableFooterView = tbView
        self.tableView?.delegate = self
        self.tableView?.backgroundColor = UIColor(red: 244/255.0, green: 244/255.0, blue: 244/255.0, alpha: 1)
        self.tableView?.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        self.view .addSubview(self.tableView!)
        
        let block : cellConfigureBlock? = {
            cell, item in
            (cell as! MainTableViewCell).titleLb.text = (item as! String)
        }
        
        self.dataArray =  ["Objective-C", "Swift", "Javascript", "SQLite", "Python", "HTML5", "C++", "..."]
        self.dataSource = ArrayDataSource(items:self.dataArray!, reuseIdentifier:reuseIdentifier, cellBlock:block, isSys:false)
        self.tableView?.dataSource = self.dataSource
    }
    
    // MARK: - selector
    func leftBarBtnPressed() {
        let tempDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        if tempDelegate.leftVc?.isOpened == true {
            tempDelegate.leftVc?.closeLeftSlideViewController()
            self.tableView?.userInteractionEnabled = true
            self.swipe!.direction = UISwipeGestureRecognizerDirection.Right
        }
        else {
            tempDelegate.leftVc?.openLeftSlideViewController()
            self.tableView?.userInteractionEnabled = false
            self.swipe!.direction = UISwipeGestureRecognizerDirection.Left
        }

    }
    
    // MARK: - UITableViewDelegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        let pushVC = NewPushViewController()
        pushVC.navTitle = (self.dataArray![indexPath.row] as! String)
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
