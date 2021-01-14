//
//  MainPageViewController.m
//  PatientApp
//
//  Created by mac on 2020/10/12.
//

#import "PLMainPageViewController.h"
//@class MySwiftView;
#import "PatientApp-Swift.h"
@interface PLMainPageViewController ()

@end

@implementation PLMainPageViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
   
    UIButton *centenbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    centenbutton.backgroundColor = UIColor.grayColor;
    [self.view addSubview:centenbutton];
    [centenbutton addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    [centenbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(100);
        make.width.height.mas_equalTo(50);
    }];
    
    
}

- (void)clickButton{
    SwiftVC *vc = [[SwiftVC alloc]init];
    vc.hidesBottomBarWhenPushed = true;
    [self.navigationController pushViewController:vc animated:YES];
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
