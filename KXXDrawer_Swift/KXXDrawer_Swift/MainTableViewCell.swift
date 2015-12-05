//
//  MainTableViewCell.swift
//  KXXDrawer_Swift
//
//  Created by Kxx.xxQ 一生相伴 on 15/12/5.
//  Copyright © 2015年 asahi_kuang. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet var icon: UIImageView!
    @IBOutlet var titleLb: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.titleLb.textColor = UIColor(red: 115/255.0, green: 155/255.0, blue: 6/255.0, alpha: 1)
        self.titleLb.font = UIFont.boldSystemFontOfSize(20)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
