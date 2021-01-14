//
//  PLRegisterViewController.m
//  PatientApp
//
//  Created by mac on 2020/10/15.
//

#import "PLRegisterViewController.h"
#import "PLRegisterRootView.h"

@interface PLRegisterViewController ()

@property (strong,nonatomic) PLRegisterRootView *rootView;

@property (strong,nonatomic) PLLoginViewModel *viewModel;

@end

@implementation PLRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showHeader];
    self.header.title.text = @"注册";
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

-(PLRegisterRootView *)rootView
{
    if (_rootView == nil)
    {
        _rootView = [[PLRegisterRootView alloc]initWithFrame:CGRectMake(0, self.header.bottom, self.view.bounds.size.width, SCREEN_HEIGHT - self.header.bottom) withViewModel:self.viewModel];
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
