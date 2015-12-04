//
//  ArrayDataSource.m
//  KQXDrawer
//
//  Created by Kxx.xxQ 一生相伴 on 15/12/4.
//  Copyright © 2015年 asahi_kuang. All rights reserved.
//

#import "ArrayDataSource.h"

@interface ArrayDataSource ()
@property (nonatomic, copy) NSString *reuseIdentifier;
@property (nonatomic, copy) cellConfigureBlock block;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, assign) BOOL isSystemCell;    // 是否为系统自带cell
@end

@implementation ArrayDataSource

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (instancetype)initWithItems:(NSArray *)items
          withReuseIdentifier:(NSString *)identifier
       withCellConfigureBlock:(cellConfigureBlock)block isSystemCell:(BOOL)isSystem{
    
    self = [super init];
    if (self) {
        self.reuseIdentifier = identifier;
        self.block = [block copy];
        self.dataArray = items;
        self.isSystemCell = isSystem;
    }
    return self;
}

- (id)objectAtIndexPath:(NSIndexPath *)indexPath {
    return [self.dataArray objectAtIndex:(NSUInteger) indexPath.row];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return (NSUInteger) [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id item = [self objectAtIndexPath:indexPath];
    if (self.isSystemCell) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.reuseIdentifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.reuseIdentifier];
            // 设置cell图片
            [self setImageViewPicOfCell:cell atIndexPath:indexPath];
        }
        else {
            while ([cell.contentView.subviews lastObject]) {
                [[cell.contentView.subviews lastObject] removeFromSuperview];
            }
        }
        self.block(cell, item);
        return cell;
    }
    else {
        id cell = [tableView dequeueReusableCellWithIdentifier:self.reuseIdentifier forIndexPath:indexPath];
        self.block(cell, item);
        return cell;
    }
}

- (void)setImageViewPicOfCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
     NSString *menuItemName = [NSString stringWithFormat:@"qfile_mpfile_menu_icon%ld", indexPath.row + 1];
    [cell.imageView setImage:[UIImage imageNamed:menuItemName]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
