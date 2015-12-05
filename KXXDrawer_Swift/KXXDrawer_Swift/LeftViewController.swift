//
//  LeftViewController.swift
//  KXXDrawer_Swift
//
//  Created by Kxx.xxQ 一生相伴 on 15/12/4.
//  Copyright © 2015年 asahi_kuang. All rights reserved.
//

import UIKit

let reuseIdentifierr = "identifier"
class LeftViewController: UIViewController, UITableViewDelegate {
    var tableView: UITableView?
    var dataArray: NSMutableArray?
    var dataSource: ArrayDataSource?
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.createUI()
        self.makeUpTableView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Create UI
    func createUI() {
        self.view.backgroundColor = UIColor.whiteColor()
        let bgImage = UIImageView(frame: CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)))
        bgImage.image = UIImage.init(imageLiteral: "backgroundPic")
        self.view.addSubview(bgImage)
        
        let userIcon = UIImageView(frame: CGRectMake(65, 70, 100, 100))
        userIcon.image = UIImage.init(imageLiteral: "user")
        userIcon.layer.masksToBounds = true
        userIcon.layer.cornerRadius  = 50
        userIcon.tag = 1991
        bgImage.addSubview(userIcon)
    }
    
    // MARK: - makeUpTableView
    func makeUpTableView() {
        //REACT_MAKE(0, 180, REACT_WIDTH(FRAME) - SCREEN_WIDTH/2+65, REACT_HEIGHT(FRAME) - 150)
        self.tableView = UITableView(frame: CGRectMake(0, 180, CGRectGetWidth(self.view.frame) - CGRectGetWidth(self.view.frame)/2 + 65, CGRectGetHeight(self.view.frame)), style: UITableViewStyle.Plain)
        let tbView = UIView.init()
        self.tableView!.tableFooterView = tbView
        self.tableView!.delegate = self
        self.tableView!.backgroundColor = UIColor.clearColor()
        self.tableView!.separatorStyle = UITableViewCellSeparatorStyle.None
        
        let block: cellConfigureBlock? = {
            cell, item in
            (cell as! UITableViewCell).textLabel!.text = (item as! String)
            (cell as! UITableViewCell).textLabel!.font = UIFont.boldSystemFontOfSize(18)
            (cell as! UITableViewCell).textLabel!.textColor = UIColor(red: 43/255.0, green: 60/255.0, blue: 47/255.0, alpha: 1)
            (cell as! UITableViewCell).backgroundColor = UIColor.clearColor()
        }
        
        let tempArray = ["我的主页", "我的圈子", "AcFun", "Bilibili", "更换主题", "设置", "退出"]
        self.dataArray = NSMutableArray.init(array: tempArray)
        
        self.dataSource = ArrayDataSource(items: self.dataArray!, reuseIdentifier: reuseIdentifierr, cellBlock: block, isSys: true)
        self.tableView!.dataSource = self.dataSource
        self.view.addSubview(self.tableView!)
    }
    
    // MARK: UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        let appdelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appdelegate.leftVc?.closeLeftSlideViewController()
        
        let pushVC = NewPushViewController()
        pushVC.navTitle = (self.dataArray![indexPath.row] as! String)
        appdelegate.mainNav?.pushViewController(pushVC, animated: true)
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
