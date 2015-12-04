//
//  LeftViewController.m
//  KQXDrawer
//
//  Created by Kxx.xxQ 一生相伴 on 15/12/4.
//  Copyright © 2015年 asahi_kuang. All rights reserved.
//

#import "LeftViewController.h"
#import "AppDelegate.h"
#import "MenuPushViewController.h"

static NSString *const reuseIdentifier = @"identifier";
@interface LeftViewController ()<UITableViewDelegate>
@property (nonatomic, strong) UITableView *contenTable;
@property (nonatomic, strong) NSMutableArray *dataArray;
// 分离出去的dataSource
@property (nonatomic, strong) ArrayDataSource *dataSource;
@end

@implementation LeftViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
    [self setUpTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - lazy loading
- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

#pragma mark - mothods
- (void)createUI {
    UIImageView *leftBgImage = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [leftBgImage setImage:[UIImage imageNamed:@"backgroundPic"]];
    [self.view addSubview:leftBgImage];
    
    UIImageView *userIcon = [[UIImageView alloc] initWithFrame:REACT_MAKE(65, 70, 100, 100)];
    [userIcon setImage:[UIImage imageNamed:@"user"]];
    [userIcon.layer setMasksToBounds:YES];
    [userIcon.layer setCornerRadius:50.f];
    [userIcon setTag:ICON_TAG];
    [leftBgImage addSubview:userIcon];
}

- (void)setUpTableView {
    _contenTable = [[UITableView alloc] initWithFrame:REACT_MAKE(0, 200, REACT_WIDTH(FRAME), REACT_HEIGHT(FRAME) - 200) style:UITableViewStylePlain];
    [_contenTable setDelegate:self];
    [_contenTable setSeparatorStyle:UITableViewCellSeparatorStyleSingleLineEtched];
    [_contenTable setBackgroundColor:[UIColor clearColor]];
    [_contenTable setTableFooterView:[UIView new]];
    [self.view addSubview:_contenTable];
    
    // 实现分离出去的dataSource
    cellConfigureBlock block = ^(UITableViewCell *cell, NSString *item) {
        [cell setBackgroundColor:[UIColor clearColor]];
        [cell.textLabel setTextColor:RGB(221, 55, 0)];
        [cell.textLabel setFont:BOLD(18.F)];
        [cell.textLabel setTextAlignment:NSTextAlignmentLeft];
        [cell setSelectionStyle:UITableViewCellSelectionStyleBlue];
        [cell.textLabel setText:item];
    };
    NSArray *contents = @[@"我的圈子", @"我的收藏", @"主题商城", @"AcFun", @"Bilibili", @"退出账号", @"设置"];
    [self.dataArray addObjectsFromArray:contents];
    _dataSource = [[ArrayDataSource alloc] initWithItems:self.dataArray withReuseIdentifier:reuseIdentifier withCellConfigureBlock:block isSystemCell:YES];
    [_contenTable setDataSource:_dataSource];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    AppDelegate *deleg = [[UIApplication sharedApplication] delegate];
    [deleg.leftSlideVC closeLeftViewController];
    
    MenuPushViewController *mpVC = [[MenuPushViewController alloc] init];
    [mpVC setNavTitleStr:self.dataArray[indexPath.row]];
    [deleg.mainNav pushViewController:mpVC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.f;
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
