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
#import "RuntimeStudyViewController.h"
#import "UIControl+ZHRepeatClick.h"
#import "GCDTestViewController.h"
#import "H5TestViewController.h"

const NSInteger singleViewHeight = 50;

@interface PLMainPageViewController ()

@end

@implementation PLMainPageViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
   
    UIButton *centenbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    centenbutton.zh_acceptEventInterval = 4;
    NSLog(@"centenbutton : %@",[centenbutton class]);
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
    
    //
    UIButton *centenbutton4 = [UIButton buttonWithType:UIButtonTypeCustom];
    centenbutton4.backgroundColor = UIColor.grayColor;
    [centenbutton4 setTitle:@"runtime测试" forState:UIControlStateNormal];
    [self.view addSubview:centenbutton4];
    [centenbutton4 addTarget:self action:@selector(runtimeStudy) forControlEvents:UIControlEventTouchUpInside];
    [centenbutton4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(centenbutton3.mas_bottom).mas_offset(10);
        make.height.mas_equalTo(singleViewHeight);
        make.width.height.mas_equalTo(100);
    }];
    
    //
    
    UIButton *centenbutton5 = [UIButton buttonWithType:UIButtonTypeCustom];
       centenbutton5.backgroundColor = UIColor.grayColor;
       [centenbutton5 setTitle:@"gcd队列组" forState:UIControlStateNormal];
       [self.view addSubview:centenbutton5];
       [centenbutton5 addTarget:self action:@selector(GCDTest) forControlEvents:UIControlEventTouchUpInside];
       [centenbutton5 mas_makeConstraints:^(MASConstraintMaker *make) {
           make.left.mas_equalTo(20);
           make.top.mas_equalTo(centenbutton4.mas_bottom).mas_offset(10);
           make.height.mas_equalTo(singleViewHeight);
           make.width.height.mas_equalTo(100);
       }];
    
    //
    UIButton *centenbutton6 = [UIButton buttonWithType:UIButtonTypeCustom];
          centenbutton6.backgroundColor = UIColor.grayColor;
          [centenbutton6 setTitle:@"oc 与h5交互" forState:UIControlStateNormal];
          [self.view addSubview:centenbutton6];
          [centenbutton6 addTarget:self action:@selector(h5Test) forControlEvents:UIControlEventTouchUpInside];
          [centenbutton6 mas_makeConstraints:^(MASConstraintMaker *make) {
              make.left.mas_equalTo(20);
              make.top.mas_equalTo(centenbutton5.mas_bottom).mas_offset(10);
              make.height.mas_equalTo(singleViewHeight);
              make.width.height.mas_equalTo(100);
          }];
}

- (void)h5Test{
    H5TestViewController *h5VC = [[H5TestViewController alloc]init];
    h5VC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:h5VC animated:YES];
    
}


- (void)GCDTest{
    GCDTestViewController *gcdVC = [[GCDTestViewController alloc]init];
    gcdVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:gcdVC animated:YES];
}

- (void)runtimeStudy{
    RuntimeStudyViewController *runTimeVC = [[RuntimeStudyViewController alloc]init];
    runTimeVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:runTimeVC animated:YES];
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
    NSLog(@"跳转swift");
//    SwiftVC *vc = [[SwiftVC alloc]init];
//    vc.hidesBottomBarWhenPushed = true;
//    [self.navigationController pushViewController:vc animated:YES];
}


@end
