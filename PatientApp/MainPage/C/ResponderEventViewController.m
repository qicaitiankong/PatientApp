//
//  ResponderEventViewController.m
//  PatientApp
//
//  Created by Lizihao Li on 2021/3/19.
//

#import "ResponderEventViewController.h"
#import "ResponderTestView.h"

@interface ResponderEventViewController ()

@end

@implementation ResponderEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    ResponderTestView *view = [[ResponderTestView alloc]initWithFrame:CGRectMake(30, 80, 160, 300)];
    [self.view addSubview:view];
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
