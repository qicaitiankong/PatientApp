//
//  PLMyPageBaseScrollView.m
//  PatientApp
//
//  Created by mac on 2020/10/13.
//

#import "PLMyPageBaseScrollView.h"
#import "PLLoginViewModel.h"

@interface PLMyPageBaseScrollView ()
{
    UIScrollView *baseScrollView;
}

@property (strong,nonatomic) UIView *topBackBlueImageView;

@property (strong,nonatomic) PLCommonCornerButtonView *existLoginView;

@property (strong,nonatomic) MyPageMainViewModel *viewModel;

@end

@implementation PLMyPageBaseScrollView

- (instancetype)initWithFrame:(CGRect)frame withViewModel:(MyPageMainViewModel*)localViewModel
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.viewModel = localViewModel;
        self.topBackBlueImageView.frame = CGRectMake(0, 0, frame.size.width, ceilf(SCREEN_HEIGHT * 0.255));
        [self addSubview:self.topBackBlueImageView];
        
        CAGradientLayer *gradient = [CAGradientLayer layer];
        gradient.frame = self.topBackBlueImageView.bounds;
        gradient.colors = [NSArray arrayWithObjects:
                           (id)[UIColor colorWithRed:64/255.0 green:113/255.0 blue:255/255.0 alpha:1.0].CGColor,
                           (id)[UIColor colorWithRed:64/255.0 green:113/255.0 blue:255/255.0 alpha:0.35].CGColor,
                           (id)[UIColor colorWithRed:64/255.0 green:113/255.0 blue:255/255.0 alpha:0].CGColor,nil];
        gradient.locations = @[@0.0,@0.85,@0.95];
        [self.topBackBlueImageView.layer addSublayer:gradient];
        
        
        baseScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [self addSubview:baseScrollView];
        
        self.topView = [[PLMyPageTopPartView alloc]initWithFrame:CGRectMake(15, self.topBackBlueImageView.height / 2, SCREEN_WIDTH - 30, SCREEN_HEIGHT * 0.2)];
        [baseScrollView addSubview:self.topView];
        
        self.centerGroupView = [[PLMyPageCenterGroupView alloc]initWithFrame:CGRectMake(15, self.topView.bottom + 10, SCREEN_WIDTH - 30, SCREEN_HEIGHT * 0.07 * 4)];
        self.centerGroupView.BD = BorderDirectionTop | BorderDirectionBottom | BorderDirectionLeft | BorderDirectionRight;
        self.centerGroupView.radius = 6;
        self.centerGroupView.borderColor = [UIColor colorWithHexString:@"#EEEEEE"];
        self.centerGroupView.borderWidth = 1;
        [baseScrollView addSubview:self.centerGroupView];
        
        CGFloat existButtonHeight = ceilf(self.centerGroupView.width * 0.13);
        self.existLoginView = [[PLCommonCornerButtonView alloc]initWithFrame:CGRectMake(15, self.centerGroupView.bottom + 30, self.centerGroupView.width, existButtonHeight)];
        self.existLoginView.titleLabel.text = @"退出登录";
        self.existLoginView.titleLabel.textColor = [UIColor colorWithHexString:@"#999999"];
        self.existLoginView.layer.borderWidth = 2;
        self.existLoginView.layer.borderColor = [UIColor colorWithHexString:@"#CCCCCC"].CGColor;
        self.existLoginView.hidden = ([PLLoginViewModel judgeUserLogin] ? NO : YES);
        [baseScrollView addSubview:self.existLoginView];
        [baseScrollView setContentSize:CGSizeMake(baseScrollView.width, self.existLoginView.bottom + 80)];
        
        self.topView.nameLabel.text = self.viewModel.model.nameStr;
        self.topView.telephoneLabel.text = self.viewModel.model.telephoneStr;
        self.topView.identityNumberLabel.text = self.viewModel.model.identityNumberStr;
        WS(weakSelf);
        self.topView.clickButtonBlock =
        ^{
            weakSelf.viewModel.clickButtonType = ClickUserPhoto;
            [weakSelf.viewModel dealOperationWhenClickByType];
        };
       
        self.centerGroupView.clickButtonStyle = ^(NSInteger buttonTag)
        {
            
            switch (buttonTag) {
                case 0:
                {
                    weakSelf.viewModel.clickButtonType = ClickPersonalInfo;
                }
                    break;
                case 1:
                {
                    weakSelf.viewModel.clickButtonType = ClickCustomerService;
                }
                    break;
                case 2:
                {
                    weakSelf.viewModel.clickButtonType = ClickAmendPassWord;
                }
                    break;
                case 3:
                {
                    weakSelf.viewModel.clickButtonType = ClickUpdateApp;
                }
                    break;
                default:
                    break;
            }
            [weakSelf.viewModel dealOperationWhenClickByType];
        };
        self.existLoginView.clickButtonBlock =
        ^{
            weakSelf.viewModel.clickButtonType = ClickExistLogin;
            [weakSelf.viewModel dealOperationWhenClickByType];
        };
        
        self.viewModel.loginSucessBlock = ^{
            [weakSelf adjustLoginButtonDisplay];
        };
        self.viewModel.loginOutSucessBlock = ^{
            [weakSelf adjustLoginButtonDisplay];
        };
    }
    return self;
}
///调整登录按钮显示
- (void)adjustLoginButtonDisplay
{
    self.existLoginView.hidden = ![PLLoginViewModel judgeUserLogin];
    [self layoutIfNeeded];
}



-(UIView *)topBackBlueImageView
{
    if (_topBackBlueImageView == nil)
    {
        _topBackBlueImageView = [[UIView alloc]init];
    }
    return _topBackBlueImageView;
}


@end
