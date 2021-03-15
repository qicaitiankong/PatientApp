//
//  SetNeedsLayoutTestViewController.m
//  PatientApp
//
//  Created by Lizihao Li on 2021/2/14.
//

#import "SetNeedsLayoutTestViewController.h"
#import "LaoutNeedTestView.h"

@interface SetNeedsLayoutTestViewController ()

@end

@implementation SetNeedsLayoutTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    LaoutNeedTestView *view = [[LaoutNeedTestView alloc]initWithFrame:CGRectMake(0, 100, 220, 80)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    [view addSubTestView];
    
    
    
    
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
