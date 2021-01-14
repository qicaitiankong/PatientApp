//
//  PLLoginViewController.m
//  PatientApp
//
//  Created by mac on 2020/10/13.
//

#import "PLLoginViewController.h"
#import "PLLoginRootView.h"

@interface PLLoginViewController ()

@property (strong,nonatomic) PLLoginRootView *rootView;

@property (strong,nonatomic) PLLoginViewModel *viewModel;

@end

@implementation PLLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showHeader];
    [self.header setLeftButtonDefaultImage];
    WS(weakSelf);
    self.header.click = ^(BOOL left)
    {
        if(left)
        {
            [weakSelf.navigationController popViewControllerAnimated:YES];
        }
    };
    [self.view addSubview:self.rootView];
    
}


-(PLLoginRootView *)rootView
{
    if (_rootView == nil)
    {
        _rootView = [[PLLoginRootView alloc] initWithFrame:CGRectMake(0, self.header.bottom, self.view.bounds.size.width, SCREEN_HEIGHT - self.header.bottom) withViewModel:self.viewModel];
    }
    return _rootView;
}

-(PLLoginViewModel *)viewModel
{
    if (_viewModel == nil)
    {
        _viewModel = [[PLLoginViewModel alloc]init];
    }
    return _viewModel;
}


@end
