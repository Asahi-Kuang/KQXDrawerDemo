//
//  MenuPushViewController.m
//  KQXDrawer
//
//  Created by Kxx.xxQ 一生相伴 on 15/12/4.
//  Copyright © 2015年 asahi_kuang. All rights reserved.
//

#import "MenuPushViewController.h"

@interface MenuPushViewController ()

@end

@implementation MenuPushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [NAV_ITEM setTitle:self.navTitleStr];
    BACKGROUND(self.view, RGBA(43, 70, 47, 1));
    UILabel *navTitle = [[UILabel alloc] initWithFrame:REACT_MAKE(0, 0, 100, 40)];
    [navTitle setText:self.navTitleStr];
    [navTitle setTextAlignment:NSTextAlignmentCenter];
    [navTitle setTextColor:RGB(255, 255, 255)];
    [navTitle setFont:BOLD(20.f)];
    UIButton *leftBarBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBarBtn setFrame:REACT_MAKE(0, 0, 40, 40)];
    [leftBarBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [leftBarBtn addTarget:self action:@selector(leftBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    [NAV_ITEM setTitleView:navTitle];
    [NAV_ITEM setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:leftBarBtn]];
    [NAV_BAR setBarTintColor:RGB(115, 140, 6)];
}
- (void)leftBtnPressed {
    [NAV_CONTROLLER popToRootViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
