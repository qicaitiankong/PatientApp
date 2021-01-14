//
//  PLForgetPasswordViewController.m
//  PatientApp
//
//  Created by mac on 2020/10/20.
//

#import "PLFindPasswordViewController.h"
#import "PLFindPassWordRootView.h"

@interface PLFindPasswordViewController ()

@property (strong,nonatomic) PLFindPassWordViewModel *viewModel;

@property (strong,nonatomic) PLFindPassWordRootView *rootView;


@end

@implementation PLFindPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showHeader];
    [self.header setLeftButtonDefaultImage];
    self.header.title.text = @"找回密码";
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

-(PLFindPassWordRootView *)rootView
{
    if (_rootView == nil)
    {
        _rootView = [[PLFindPassWordRootView alloc] initWithFrame:CGRectMake(0, self.header.bottom, self.view.bounds.size.width, SCREEN_HEIGHT - self.header.bottom) withViewModel:self.viewModel];
    }
    return _rootView;
}

-(PLFindPassWordViewModel *)viewModel
{
    if (_viewModel == nil)
    {
        _viewModel = [[PLFindPassWordViewModel alloc]init];
    }
    return _viewModel;
}


@end
