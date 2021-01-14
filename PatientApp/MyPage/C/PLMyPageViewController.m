//
//  MyPageViewController.m
//  PatientApp
//
//  Created by mac on 2020/10/12.
//

#import "PLMyPageViewController.h"
#import "PLMyPageRootView.h"

@interface PLMyPageViewController ()
{
    PLMyPageRootView *rootView;
}

@property (strong,nonatomic) MyPageMainViewModel *viewModel;

@end

@implementation PLMyPageViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.viewModel getPersonalInfo];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    rootView = [[PLMyPageRootView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, SCREEN_HEIGHT - TAB_BAR_HEIGHT) withViewModel:self.viewModel];
    [self.view addSubview:rootView];
    
    [self.viewModel getPersonalInfo];
    
}

-(MyPageMainViewModel *)viewModel
{
    if (_viewModel == nil)
    {
        _viewModel = [[MyPageMainViewModel alloc]init];
    }
    return _viewModel;
}

@end
