//
//  NewPushViewController.swift
//  KXXDrawer_Swift
//
//  Created by Kxx.xxQ 一生相伴 on 15/12/5.
//  Copyright © 2015年 asahi_kuang. All rights reserved.
//

import UIKit

class NewPushViewController: UIViewController {
    
    var navTitle: String?
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createUI()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - methods
    func createUI() {
        self.view.backgroundColor = UIColor(red: 2/255.0, green: 179/255.0, blue: 64/255.0, alpha: 1)
        let leftBtn = UIButton(type: UIButtonType.Custom)
        leftBtn.frame = CGRectMake(0, 0, 50, 50)
        leftBtn.setImage(UIImage(imageLiteral: "back"), forState: UIControlState.Normal)
        leftBtn.addTarget(self, action: Selector.init("goBack"), forControlEvents: UIControlEvents.TouchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBtn)
        
        let navTitleLb = UILabel(frame: CGRectMake(0, 0, 100 ,40))
        navTitleLb.text = self.navTitle
        navTitleLb.textAlignment = NSTextAlignment.Center
        navTitleLb.textColor = UIColor.whiteColor()
        navTitleLb.font = UIFont.boldSystemFontOfSize(20)
        self.navigationItem.titleView = navTitleLb
    }

    func goBack() {
        self.navigationController?.popToRootViewControllerAnimated(true)
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
