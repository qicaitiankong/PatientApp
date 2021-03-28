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
#import "LockTestViewController.h"
#import "SetNeedsLayoutTestViewController.h"
#import "KVCKVOViewController.h"
#import "NSTimerViewController.h"
#import "LayerTestViewController.h"
#import "ResponderEventViewController.h"


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
        make.width.mas_equalTo(100);
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
           make.width.mas_equalTo(100);
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
        make.width.mas_equalTo(100);
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
        make.width.mas_equalTo(100);
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
           make.width.mas_equalTo(100);
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
              make.width.mas_equalTo(100);
          }];
    
    UIButton *centenbutton7 = [UIButton buttonWithType:UIButtonTypeCustom];
             centenbutton7.backgroundColor = UIColor.grayColor;
             [centenbutton7 setTitle:@"锁测试" forState:UIControlStateNormal];
             [self.view addSubview:centenbutton7];
             [centenbutton7 addTarget:self action:@selector(lockTest) forControlEvents:UIControlEventTouchUpInside];
             [centenbutton7 mas_makeConstraints:^(MASConstraintMaker *make) {
                 make.left.mas_equalTo(20);
                 make.top.mas_equalTo(centenbutton6.mas_bottom).mas_offset(10);
                 make.height.mas_equalTo(singleViewHeight);
                 make.width.mas_equalTo(100);
             }];
    UIButton *centenbutton8 = [UIButton buttonWithType:UIButtonTypeCustom];
                centenbutton8.backgroundColor = UIColor.grayColor;
                [centenbutton8 setTitle:@"setneedsLayout" forState:UIControlStateNormal];
                [self.view addSubview:centenbutton8];
                [centenbutton8 addTarget:self action:@selector(setNeedsTest) forControlEvents:UIControlEventTouchUpInside];
                [centenbutton8 mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.mas_equalTo(20);
                    make.top.mas_equalTo(centenbutton7.mas_bottom).mas_offset(10);
                    make.height.mas_equalTo(singleViewHeight);
                    make.width.mas_equalTo(160);
                }];
    UIButton *centenbutton9 = [UIButton buttonWithType:UIButtonTypeCustom];
    centenbutton9.backgroundColor = UIColor.grayColor;
    [centenbutton9 setTitle:@"kvc Kvo" forState:UIControlStateNormal];
    [self.view addSubview:centenbutton9];
    [centenbutton9 addTarget:self action:@selector(KVCkVOTest) forControlEvents:UIControlEventTouchUpInside];
    [centenbutton9 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(centenbutton8.mas_bottom).mas_offset(10);
        make.height.mas_equalTo(singleViewHeight);
        make.width.mas_equalTo(160);
    }];
    
    UIButton *centenbutton10 = [UIButton buttonWithType:UIButtonTypeCustom];
       centenbutton10.backgroundColor = UIColor.grayColor;
       [centenbutton10 setTitle:@"NSTimer 定时器" forState:UIControlStateNormal];
       [self.view addSubview:centenbutton10];
       [centenbutton10 addTarget:self action:@selector(NStimerTest) forControlEvents:UIControlEventTouchUpInside];
       [centenbutton10 mas_makeConstraints:^(MASConstraintMaker *make) {
           make.right.mas_equalTo(self.view).mas_offset(-20);
           make.top.mas_equalTo(centenbutton);
           make.height.mas_equalTo(singleViewHeight);
           make.width.mas_equalTo(160);
       }];
    //
    UIButton *centenbutton11 = [UIButton buttonWithType:UIButtonTypeCustom];
    centenbutton11.backgroundColor = UIColor.grayColor;
    [centenbutton11 setTitle:@"CALayer" forState:UIControlStateNormal];
    [self.view addSubview:centenbutton11];
    [centenbutton11 addTarget:self action:@selector(layerTest) forControlEvents:UIControlEventTouchUpInside];
    [centenbutton11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.view).mas_offset(-20);
        make.top.mas_equalTo(centenbutton10.mas_bottom).mas_offset(20);
        make.height.mas_equalTo(singleViewHeight);
        make.width.mas_equalTo(160);
    }];
    //
    UIButton *centenbutton12 = [UIButton buttonWithType:UIButtonTypeCustom];
       centenbutton12.backgroundColor = UIColor.grayColor;
       [centenbutton12 setTitle:@"响应链" forState:UIControlStateNormal];
       [self.view addSubview:centenbutton12];
       [centenbutton12 addTarget:self action:@selector(hitTestViewTest) forControlEvents:UIControlEventTouchUpInside];
       [centenbutton12 mas_makeConstraints:^(MASConstraintMaker *make) {
           make.right.mas_equalTo(self.view).mas_offset(-20);
           make.top.mas_equalTo(centenbutton11.mas_bottom).mas_offset(20);
           make.height.mas_equalTo(singleViewHeight);
           make.width.mas_equalTo(160);
       }];
    NSLog(@"主线程打印文字1");
    dispatch_queue_t concurrentQueue = dispatch_queue_create("queue1", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(concurrentQueue, ^{
          NSLog(@"异步并行队列");
      });
    NSLog(@"主线程打印文字2");
    
    UIView *view100 = [UIView new];
   // view100.translatesAutoresizingMaskIntoConstraints = NO;
    view100.backgroundColor = [UIColor yellowColor];
    view100.bounds = CGRectMake(0, 10, 20, 100);
    [self.view addSubview:view100];
    //
    if (view100.translatesAutoresizingMaskIntoConstraints){
        NSLog(@"布局约束为1");
        view100.frame = CGRectMake(10, 150, 20,50);
        //[self.view layoutIfNeeded];
    }else{
        NSLog(@"布局约束为0");
        view100.frame = CGRectMake(10, 150, 20,50);
        //[self.view layoutIfNeeded];
    }
    NSLog(@"%lf,%lf",self.view.frame.origin.x,self.view.frame.origin.y);
    
    
}

- (void)hitTestViewTest{
    ResponderEventViewController *testVC = [[ResponderEventViewController alloc]init];
    testVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:testVC animated:YES];
}


- (void)layerTest{
    LayerTestViewController *testVC = [[LayerTestViewController alloc]init];
    testVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:testVC animated:YES];
}

- (void)NStimerTest{
    NSTimerViewController *timeVC = [[NSTimerViewController alloc]init];
    timeVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:timeVC animated:YES];
}

- (void)KVCkVOTest{
    KVCKVOViewController *testVC = [[KVCKVOViewController alloc]init];
    testVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:testVC animated:YES];
}

- (void)setNeedsTest{
    SetNeedsLayoutTestViewController *testVC = [[SetNeedsLayoutTestViewController alloc]init];
    testVC.hidesBottomBarWhenPushed = YES;
     [self.navigationController pushViewController:testVC animated:YES];
}

- (void)lockTest{
    LockTestViewController *lockVC = [[LockTestViewController alloc]init];
     lockVC.hidesBottomBarWhenPushed = YES;
      [self.navigationController pushViewController:lockVC animated:YES];
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
    SwiftVC *vc = [[SwiftVC alloc]init];
    vc.hidesBottomBarWhenPushed = true;
    [self.navigationController pushViewController:vc animated:YES];
}


@end
