//
//  JSBasicViewController.m
//  JSEDU
//
//  Created by 金石 on 2018/5/8.
//  Copyright © 2018年 孔祥刚. All rights reserved.
//

#import "JSBasicViewController.h"
#import "JSHeaderView.h"

@interface JSBasicViewController ()
@end

@implementation JSBasicViewController{
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if (self.isDarkStatusBar) {
        if (@available(iOS 13.0, *)) {
            [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDarkContent;
        } else {
            [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
        }
    }
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.isDarkStatusBar) {
        if (@available(iOS 13.0, *)) {
            [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDarkContent;
        } else {
            [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
        }
    }
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    if (self.isDarkStatusBar) {
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;

    }
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (self.isDarkStatusBar) {
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = YES;
    if (self.isDarkStatusBar) {
        if (@available(iOS 13.0, *)) {
            [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDarkContent;
        } else {
            [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
        }
    }
}

-(void)logoutAction{
    if (self.navigationController) {
        for (int i = 0; i < self.navigationController.viewControllers.count;i++) {
            UIViewController *vc = self.navigationController.viewControllers[i];
            if ([vc isKindOfClass:[JSBasicViewController class]]) {
                JSBasicViewController *baseVC = (JSBasicViewController *)vc;
                if (baseVC.isNeedLoginPage) {
                    if ((i-1)>=0) {
                        UIViewController *perVC = self.navigationController.viewControllers[i-1];
                        [self.navigationController popToViewController:perVC animated:YES];
                        break;
                    }else{
                        [self.navigationController popToRootViewControllerAnimated:YES];
                        break;
                    }
                }
            }
        }
    }
}
- (void)showHeaderWithBackgroundColor:(nullable UIColor *)backgroundColor {
    [self showHeaderWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, IPHONE_NAVIGATIONBAR_HEIGHT) backgroundColor:backgroundColor];
}


- (void)showHeaderWithFrame:(CGRect)frame {
    [self showHeaderWithFrame:frame backgroundColor:nil];
}


- (void)showHeader {
    [self showHeaderWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, IPHONE_NAVIGATIONBAR_HEIGHT) backgroundColor:nil];
}


- (void)showHeaderWithFrame:(CGRect)frame backgroundColor:(nullable UIColor *)backgroundColor {
    if (!self.header) {
        self.header = [[JSHeaderView alloc] initWithFrame:frame backgroundColor:backgroundColor];
        [self.view addSubview:self.header];
    }
}


- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


@end
