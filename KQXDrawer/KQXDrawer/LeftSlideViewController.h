//
//  LeftSlideViewController.h
//  KQXDrawer
//
//  Created by Kxx.xxQ 一生相伴 on 15/12/4.
//  Copyright © 2015年 asahi_kuang. All rights reserved.
//

@interface LeftSlideViewController : UIViewController


//滑动速度
@property (assign, nonatomic) CGFloat speed;

@property (strong, nonatomic) UIViewController *leftVc;
@property (strong, nonatomic) UIViewController *mainVc;

@property (strong, nonatomic) UITapGestureRecognizer *tapGes;
//@property (strong, nonatomic) UIPanGestureRecognizer *panGes;

@property (assign, nonatomic) BOOL isOpend;


- (instancetype)initWithLeftViewController:(UIViewController *)leftVC withMainViewController:(UIViewController *)mainVC;

- (void)openLeftViewController;
- (void)closeLeftViewController;

- (void)setPanGesEnabled:(BOOL)isEnable;

@end
