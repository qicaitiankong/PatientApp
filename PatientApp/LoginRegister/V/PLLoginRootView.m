//
//  PLLoginRootView.m
//  PatientApp
//
//  Created by mac on 2020/10/13.
//

#import "PLLoginRootView.h"
#import "PLLoginInputIdentityNumberTextField.h"
#import "PLLoginInputPasswordTextFieldView.h"
#import "PLCanClickLabelWithBottomHorinzontalLine.h"

@interface PLLoginRootView ()
{
    CGFloat textFieldHeight;
    CGFloat leftSpace;
    CGFloat screenHeight;
}

@property (strong,nonatomic) PLCustomLabel *topTitleLabel;

@property (strong,nonatomic) PLLoginInputIdentityNumberTextField *identityNumberField;

@property (strong,nonatomic) PLLoginInputPasswordTextFieldView *passwordField;

@property (strong,nonatomic) PLCommonCornerButtonView *loginButtonView;

@property (strong,nonatomic) PLCommonCornerButtonView *registerButtonView;

@property (strong,nonatomic) PLCanClickLabelWithBottomHorinzontalLine *forgetPassWordView;

@property (strong,nonatomic) PLLoginViewModel *viewModel;

@end


@implementation PLLoginRootView

- (instancetype)initWithFrame:(CGRect)frame withViewModel:(PLLoginViewModel*)viewModel
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.viewModel = viewModel;
        screenHeight = SCREEN_HEIGHT;
        leftSpace = 15;
        [self addViews];
    }
    return self;
}

- (void)addViews
{
    self.topTitleLabel.text = @"欢迎登录";
    self.identityNumberField.textFieldView.textField.placeholder = @"请输入身份证号";
    
    self.passwordField.textFieldView.textField.placeholder = @"请输入密码";
        
    self.loginButtonView.titleLabel.text = @"登录";
    self.loginButtonView.titleLabel.font = [UIFont getPingFangRegularFont:16];
    self.loginButtonView.titleLabel.textColor = [UIColor whiteColor];
    self.loginButtonView.titleLabel.backgroundColor = [UIColor colorWithHexString:@"#4071FF"];
    WS(weakSelf);
    self.loginButtonView.clickButtonBlock = ^{
        __strong typeof(self)strongSelf = weakSelf;
        strongSelf.viewModel.clickType = ClickLogin;
        strongSelf.viewModel.loginIdentityStr = strongSelf.identityNumberField.textFieldView.textField.text;
        strongSelf.viewModel.loginPassStr = strongSelf.passwordField.textFieldView.textField.text;
        [strongSelf.viewModel dealOperationByClickState];
    };
    
    self.registerButtonView.titleLabel.text = @"注册";
    self.registerButtonView.layer.borderWidth = 1;
    self.registerButtonView.titleLabel.font = [UIFont getPingFangRegularFont:16];
    self.registerButtonView.titleLabel.textColor = [UIColor colorWithHexString:@"#4071FF"];
    self.registerButtonView.layer.borderColor = [UIColor colorWithHexString:@"#4071FF"].CGColor;
    self.registerButtonView.clickButtonBlock = ^{
        weakSelf.viewModel.clickType = ClickRegister;
        [weakSelf.viewModel dealOperationByClickState];
    };
    
    
    self.forgetPassWordView = [[PLCanClickLabelWithBottomHorinzontalLine alloc]initWithFrame:CGRectZero labelHeight:15 localTitleStr:@"忘记密码?" localFont:[UIFont getPingFangRegularFont:14] localTextColor:[UIColor colorWithHexString:@"#385CF2"] localLineColor:[UIColor colorWithHexString:@"#385CF2"]];
    self.forgetPassWordView.clickButtonBlock = ^{
        weakSelf.viewModel.clickType = ClickForgetPassWorld;
        [weakSelf.viewModel dealOperationByClickState];
    };
    
    [self addSubview:self.topTitleLabel];
    [self addSubview:self.identityNumberField];
    [self addSubview:self.passwordField];
    [self addSubview:self.loginButtonView];
    [self addSubview:self.registerButtonView];
    [self addSubview:self.forgetPassWordView];
    
    
    textFieldHeight = screenHeight * 0.074;
    [self.topTitleLabel mas_makeConstraints:^(MASConstraintMaker *make)
     {
        make.left.mas_equalTo(self).mas_offset(leftSpace);
        make.right.mas_equalTo(self).mas_offset(-leftSpace);
        make.top.mas_equalTo(self).mas_offset(25);
        make.height.mas_equalTo(screenHeight * 0.067);
    }];
    
    [self.identityNumberField mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.left.mas_equalTo(self.topTitleLabel);
        make.right.mas_equalTo(self.mas_right).mas_offset(-leftSpace);
        make.top.mas_equalTo(self.topTitleLabel.mas_bottom).mas_offset(screenHeight * 0.054);
        make.height.mas_equalTo(textFieldHeight);
    }];
    
    [self.passwordField mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.left.mas_equalTo(self.topTitleLabel);
        make.right.mas_equalTo(self.mas_right).mas_offset(-leftSpace);
        make.top.mas_equalTo(self.identityNumberField.mas_bottom);
        make.height.mas_equalTo(textFieldHeight);
    }];
    
    
    [self.loginButtonView mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.left.right.mas_equalTo(self.passwordField);
        make.top.mas_equalTo(self.passwordField.mas_bottom).mas_offset(screenHeight * 0.044);
        make.height.mas_equalTo(self.loginButtonView.height);
    }];
    
    [self.registerButtonView mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.left.right.mas_equalTo(self.passwordField);
        make.top.mas_equalTo(self.loginButtonView.mas_bottom).mas_offset(screenHeight * 0.022);
        make.height.mas_equalTo(self.registerButtonView.height);
    }];
    
    
    [self.forgetPassWordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self).mas_offset(-screenHeight * 0.075);
        make.height.mas_equalTo(15);
        make.width.mas_equalTo(self.forgetPassWordView.width);
        make.centerX.mas_equalTo(self);
    }];
    
}


-(PLCustomLabel *)topTitleLabel
{
    if (_topTitleLabel == nil)
    {
        _topTitleLabel = [[PLCustomLabel alloc]initWithCustomerParamer:[UIFont getPingFangRegularFont:28] titleColor:[UIColor colorWithHexString:@"#222222"] aligement:0];
    }
    return _topTitleLabel;
}

-(PLLoginInputIdentityNumberTextField  *)identityNumberField
{
    if (_identityNumberField == nil)
    {
        _identityNumberField = [[PLLoginInputIdentityNumberTextField alloc]initWithFrame:CGRectMake(0, 0,self.width - leftSpace * 2, textFieldHeight)];
    }
    return _identityNumberField;
}

-(PLLoginInputPasswordTextFieldView *)passwordField
{
    if (_passwordField == nil)
    {
        _passwordField = [[PLLoginInputPasswordTextFieldView alloc]init];
    }
    return _passwordField;
}


-(PLCommonCornerButtonView *)loginButtonView
{
    if (_loginButtonView == nil)
    {
        _loginButtonView = [[PLCommonCornerButtonView alloc]initWithFrame:CGRectMake(0, 0, self.width - leftSpace * 2, screenHeight * 0.067)];
    }
    return _loginButtonView;
}

-(PLCommonCornerButtonView *)registerButtonView
{
    if (_registerButtonView == nil)
    {
        _registerButtonView= [[PLCommonCornerButtonView alloc]initWithFrame:CGRectMake(0, 0, self.width - leftSpace * 2, screenHeight * 0.067)];
    }
    return _registerButtonView;
}

@end
