//
//  MainViewController.m
//  KQXDrawer
//
//  Created by Kxx.xxQ 一生相伴 on 15/12/4.
//  Copyright © 2015年 asahi_kuang. All rights reserved.
//

#import "MainViewController.h"
#import "AppDelegate.h"
#import "MainTableViewCell.h"

static NSString *const reuseIdentifier = @"identifier";
@interface MainViewController ()<UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) ArrayDataSource *dataSource;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UISwipeGestureRecognizer *swipe;
@end

@implementation MainViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
    [self setUpTableView];
    
    // 注册cell
    [_tableView registerNib:[UINib nibWithNibName:@"MainTableViewCell" bundle:nil] forCellReuseIdentifier:reuseIdentifier];
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

#pragma mark - create ui
- (void)createUI {
    UILabel *navTitle = [[UILabel alloc] initWithFrame:REACT_MAKE(0, 0, 100, 40)];
    [navTitle setText:@"iOS Drawer"];
    [navTitle setTextAlignment:NSTextAlignmentCenter];
    [navTitle setTextColor:RGB(255, 255, 255)];
    [navTitle setFont:BOLD(20.f)];
    UIButton *leftBarBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBarBtn setFrame:REACT_MAKE(0, 0, 40, 40)];
    [leftBarBtn setImage:[UIImage imageNamed:@"LeftBarItem"] forState:UIControlStateNormal];
    [leftBarBtn addTarget:self action:@selector(leftBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    [NAV_ITEM setTitleView:navTitle];
    [NAV_ITEM setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:leftBarBtn]];
    [NAV_BAR setBarTintColor:RGB(230, 0, 92)];
    
    
    _swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(leftBtnPressed)];
//    [self.tableView addGestureRecognizer:_swipe];
}

#pragma mark - setUpTableView
- (void)setUpTableView {
    _tableView = [[UITableView alloc] initWithFrame:FRAME style:UITableViewStylePlain];
    [_tableView setDelegate:self];
    [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLineEtched];
    [_tableView setTableFooterView:[UIView new]];
    self.view = _tableView;
    
    // 这里使用自定义cell
    cellConfigureBlock block = ^(MainTableViewCell *cell, NSString *item) {
        [cell.cellLb setText:item];
        [cell addGestureRecognizer:_swipe];
    };
    NSArray *tools = @[@"Objective-C", @"Swift", @"Javascript", @"HTML5", @"React-Native", @"Java", @"SQLite", @"..."];
    [self.dataArray addObjectsFromArray:tools];
    self.dataSource = [[ArrayDataSource alloc] initWithItems:self.dataArray withReuseIdentifier:reuseIdentifier withCellConfigureBlock:block isSystemCell:NO];
    [_tableView setDataSource:self.dataSource];
}

#pragma mark - selector
- (void)leftBtnPressed {
    AppDelegate *deleg = [[UIApplication sharedApplication] delegate];
    if (deleg.leftSlideVC.isOpend) {
        [deleg.leftSlideVC closeLeftViewController];
        [_swipe setDirection:UISwipeGestureRecognizerDirectionRight];
    }
    else {
        [deleg.leftSlideVC openLeftViewController];
        [_swipe setDirection:UISwipeGestureRecognizerDirectionLeft];
    }
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    AppDelegate *deleg = [[UIApplication sharedApplication] delegate];
    if (deleg.leftSlideVC.isOpend) {
        [deleg.leftSlideVC closeLeftViewController];
    }
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
