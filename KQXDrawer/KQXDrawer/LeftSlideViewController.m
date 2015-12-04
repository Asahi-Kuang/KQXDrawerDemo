//
//  LeftSlideViewController.m
//  KQXDrawer
//
//  Created by Kxx.xxQ 一生相伴 on 15/12/4.
//  Copyright © 2015年 asahi_kuang. All rights reserved.
//

#import "LeftSlideViewController.h"

@interface LeftSlideViewController ()
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) CGPoint tableViewCenter;
//头像
@property (nonatomic, strong) UIImageView *userIcon;


@end

@implementation LeftSlideViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - methods
- (instancetype)initWithLeftViewController:(UIViewController *)leftVC withMainViewController:(UIViewController *)mainVC {
    self = [super init];
    if (self) {
        //
        self.speed = 0.3f;
        self.leftVc = leftVC;
        self.mainVc = mainVC;
        
        // 滑动手势
        self.panGes = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesHandler:)];
        [self.leftVc.view addGestureRecognizer:self.panGes];
        
        // 左边视图tableView获取
        for (UIView *view in self.leftVc.view.subviews) {
            if ([view isKindOfClass:[UITableView class]]) {
                self.tableView = (UITableView *) view;
            }
        }
        
        [self.tableView setFrame:REACT_MAKE(0, 165, REACT_WIDTH(FRAME) - SCREEN_WIDTH/2+65, REACT_HEIGHT(FRAME) - 150)];
        self.tableViewCenter = self.tableView.center;
        MAKE_SCALE(self.tableView, 0.1f, 0.1f);
        [self.tableView setCenter:CGPointMake(-REACT_WIDTH(self.tableView.frame), REACT_MINY(self.tableView.frame))];
        
        for (UIView *bgView in self.leftVc.view.subviews) {
            for (UIView *icon in bgView.subviews) {
                //
                if (icon.tag == ICON_TAG) {
                    self.userIcon = (UIImageView *) icon;
                }
            }
        }
        
        [self.userIcon setFrame:REACT_MAKE(50, 55, 100, 100)];
        MAKE_SCALE(self.userIcon, 0.1f, 0.1f);
        
        [self.view addSubview:self.leftVc.view];
        [self.view addSubview:self.mainVc.view];
    }
    return self;
}

- (void)openLeftViewController {
    [self.view addSubview:self.leftVc.view];
    [self.view addSubview:self.mainVc.view];
    
    [UIView animateWithDuration:0.8f delay:0 usingSpringWithDamping:0.7f initialSpringVelocity:0.1f options:UIViewAnimationOptionCurveLinear animations:^{
        //
        MAKE_SCALE(self.mainVc.view, 0.65f, 0.65f);
        [self.mainVc.view setCenter:CGPointMake(REACT_WIDTH(FRAME), REACT_HEIGHT(FRAME)/2)];
        
        MAKE_SCALE(self.tableView, 1, 1);
        [self.tableView setCenter:self.tableViewCenter];
        
        MAKE_SCALE(self.userIcon, 1, 1);
    } completion:^(BOOL finished) {
        //
    }];
    _isOpend = YES;
}

- (void)closeLeftViewController {
    [UIView animateWithDuration:0.8f delay:0 usingSpringWithDamping:0.7f initialSpringVelocity:0.1f options:UIViewAnimationOptionCurveLinear animations:^{
        //
        MAKE_TRANSLATION(self.mainVc.view, 0, 0);
        [self.mainVc.view setCenter:self.view.center];
        MAKE_SCALE(self.tableView, .1f, .1f);
        [self.tableView setCenter:CGPointMake(-REACT_WIDTH(self.tableView.frame), REACT_MINY(self.tableView.frame))];
        MAKE_SCALE(self.userIcon, 0.1f, 0.1f);
    } completion:^(BOOL finished) {
        //
        [self.leftVc.view removeFromSuperview];
    }];
    _isOpend = NO;
}

- (void)setPanGesEnabled:(BOOL)isEnable {
    [self.panGes setEnabled:isEnable];
}

#pragma mark - selector
- (void)panGesHandler:(UIPanGestureRecognizer *)pan {
    [self closeLeftViewController];
}


@end
