//
//  MainPageViewController.m
//  PatientApp
//
//  Created by mac on 2020/10/12.
//

#import "PLMainPageViewController.h"
//@class MySwiftView;
#import "PatientApp-Swift.h"
#import "BlockStudyViewController.h"
#import "CopyStudyViewController.h"

const NSInteger singleViewHeight = 50;

@interface PLMainPageViewController ()

@end

@implementation PLMainPageViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
   
    UIButton *centenbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    centenbutton.backgroundColor = UIColor.grayColor;
    [centenbutton setTitle:@"跳转swift vc" forState:UIControlStateNormal];
    [self.view addSubview:centenbutton];
    [centenbutton addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    [centenbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(IPHONE_NAVIGATIONBAR_HEIGHT);
        make.height.mas_equalTo(singleViewHeight);
        make.width.height.mas_equalTo(100);
    }];
    //block 原理探讨
    UIButton *centenbutton2 = [UIButton buttonWithType:UIButtonTypeCustom];
       centenbutton2.backgroundColor = UIColor.grayColor;
       [centenbutton2 setTitle:@"block 原理探讨" forState:UIControlStateNormal];
       [self.view addSubview:centenbutton2];
       [centenbutton2 addTarget:self action:@selector(blockStudy) forControlEvents:UIControlEventTouchUpInside];
       [centenbutton2 mas_makeConstraints:^(MASConstraintMaker *make) {
           make.left.mas_equalTo(20);
           make.top.mas_equalTo(centenbutton.mas_bottom).mas_offset(10);
           make.height.mas_equalTo(singleViewHeight);
           make.width.height.mas_equalTo(100);
       }];
    //浅拷贝深拷贝
    UIButton *centenbutton3 = [UIButton buttonWithType:UIButtonTypeCustom];
    centenbutton3.backgroundColor = UIColor.grayColor;
    [centenbutton3 setTitle:@"浅拷贝深拷贝" forState:UIControlStateNormal];
    [self.view addSubview:centenbutton3];
    [centenbutton3 addTarget:self action:@selector(copyStudy) forControlEvents:UIControlEventTouchUpInside];
    [centenbutton3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(centenbutton2.mas_bottom).mas_offset(10);
        make.height.mas_equalTo(singleViewHeight);
        make.width.height.mas_equalTo(100);
    }];
}

- (void)copyStudy{
    CopyStudyViewController *copyVC = [[CopyStudyViewController alloc]init];
    copyVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:copyVC animated:YES];
}

- (void)blockStudy{
    BlockStudyViewController *vc = [[BlockStudyViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)clickButton{
    SwiftVC *vc = [[SwiftVC alloc]init];
    vc.hidesBottomBarWhenPushed = true;
    [self.navigationController pushViewController:vc animated:YES];
}


@end
