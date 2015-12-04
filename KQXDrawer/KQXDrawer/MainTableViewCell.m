//
//  MainTableViewCell.m
//  KQXDrawer
//
//  Created by Kxx.xxQ 一生相伴 on 15/12/4.
//  Copyright © 2015年 asahi_kuang. All rights reserved.
//

#import "MainTableViewCell.h"

@implementation MainTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [self.icon.layer setMasksToBounds:YES];
    [self.icon.layer setCornerRadius:40.f];
    [self.cellLb setFont:BOLD(25.f)];
    [self.cellLb setTextColor:RGBA(21, 106, 30, 1)];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
