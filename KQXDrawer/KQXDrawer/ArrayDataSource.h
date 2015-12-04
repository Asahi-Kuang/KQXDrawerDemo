//
//  ArrayDataSource.h
//  KQXDrawer
//
//  Created by Kxx.xxQ 一生相伴 on 15/12/4.
//  Copyright © 2015年 asahi_kuang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^cellConfigureBlock)(id cell, id item);
@interface ArrayDataSource : UIViewController<UITableViewDataSource>

- (instancetype)initWithItems:(NSArray *)items
          withReuseIdentifier:(NSString *)identifier
       withCellConfigureBlock:(cellConfigureBlock)block isSystemCell:(BOOL)isSystem;

- (id)objectAtIndexPath:(NSIndexPath *)indexPath;

@end
