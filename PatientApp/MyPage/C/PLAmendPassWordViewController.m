//
//  PLAmendPassWordViewController.m
//  PatientApp
//
//  Created by mac on 2020/10/20.
//

#import "PLAmendPassWordViewController.h"
#import "PLAmendPassWordRootView.h"


@interface PLAmendPassWordViewController ()

@property (strong,nonatomic) PLAmendPassWordViewModel *viewModel;

@property (strong,nonatomic) PLAmendPassWordRootView *rootView;

@end

@implementation PLAmendPassWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showHeader];
    [self.header setLeftButtonDefaultImage];
    self.header.title.text = @"修改密码";
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


-(PLAmendPassWordRootView *)rootView
{
    if (_rootView == nil)
    {
        _rootView = [[PLAmendPassWordRootView alloc] initWithFrame:CGRectMake(0, self.header.bottom, self.view.bounds.size.width, SCREEN_HEIGHT - self.header.bottom) withViewModel:self.viewModel];
    }
    return _rootView;
}

-(PLAmendPassWordViewModel *)viewModel
{
    if (_viewModel == nil)
    {
        _viewModel = [[PLAmendPassWordViewModel alloc]init];
    }
    return _viewModel;
}

@end
