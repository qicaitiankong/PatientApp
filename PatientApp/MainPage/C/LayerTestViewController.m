//
//  LayerTestViewController.m
//  PatientApp
//
//  Created by Lizihao Li on 2021/3/17.
//

#import "LayerTestViewController.h"
#import "ZhLayerView.h"
#import "DrawRectTestView.h"

@interface LayerTestViewController ()

@end

@implementation LayerTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //ZhLayerView *myView = [[ZhLayerView alloc]initWithFrame:CGRectMake(0, 100, 200, 200)];
    //[myView setBackgroundColor:[UIColor yellowColor]];
    //[self.view addSubview:myView];
    DrawRectTestView *view = [[DrawRectTestView alloc]init];
    view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view];
    
    
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).mas_offset(50);
        make.top.mas_equalTo(self.view).mas_offset(150);
        make.width.height.mas_equalTo(60);
    }];
    [self.view layoutIfNeeded];
    NSLog(@" view 高度  %lf",view.height);
    
    
    
    
    //view.frame = CGRectMake(0,100, 20, 40);
    //[view sizeToFit];
    //[view setNeedsDisplay];
    
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
