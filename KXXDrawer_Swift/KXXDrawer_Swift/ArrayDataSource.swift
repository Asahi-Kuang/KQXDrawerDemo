//
//  ArrayDataSource.swift
//  KXXDrawer_Swift
//
//  Created by Kxx.xxQ 一生相伴 on 15/12/5.
//  Copyright © 2015年 asahi_kuang. All rights reserved.
//

import UIKit

// cell 回调
typealias cellConfigureBlock = (AnyObject, AnyObject) ->Void

class ArrayDataSource: UIViewController, UITableViewDataSource {
    
    var identifier  : String?
    var dataArray   : NSArray?
    var block       : cellConfigureBlock?
    var isSystemCell: Bool?
  // 构造方法
    init(items: NSArray, reuseIdentifier: String?, cellBlock: cellConfigureBlock?, isSys: Bool?) {
        self.dataArray    = items
        self.identifier   = reuseIdentifier
        self.isSystemCell = isSys
        self.block        = cellBlock
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("xxxxxooooooooooo")
    }
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - mothods
    func objectAtIndexPath(indexPath: NSIndexPath) -> AnyObject {
        return self.dataArray![indexPath.row]
    }
    
    // MARK: - UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let item = self.dataArray?.objectAtIndex(indexPath.row)
        if self.isSystemCell == true {
            var cell = tableView.dequeueReusableCellWithIdentifier(self.identifier!)
            if cell == nil {
                cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: self.identifier!)
                
                // 临时图标
                let picStr = String(format: "qfile_mpfile_menu_icon\(indexPath.row + 1)")
                cell!.imageView!.image = UIImage(imageLiteral: picStr)
            }
            else {
                while cell?.contentView.subviews.last != nil {
                    cell?.contentView.subviews.last?.removeFromSuperview()
                }
            }
            self.block?(cell!, item!)
            return cell!
        }
        else {
            let cell = tableView.dequeueReusableCellWithIdentifier(self.identifier!, forIndexPath: indexPath)
            self.block?(cell, item!)
            return cell
        }
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
