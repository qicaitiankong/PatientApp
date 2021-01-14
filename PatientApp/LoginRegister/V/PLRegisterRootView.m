//
//  PLRegisterRootView.m
//  PatientApp
//
//  Created by mac on 2020/10/15.
//

#import "PLRegisterRootView.h"
#import "PLLoginInputIdentityNumberTextField.h"
#import "PLLoginInputPasswordTextFieldView.h"
#import "PLRegisterInputCodeView.h"

@interface PLRegisterRootView ()
{
    CGFloat singleViewHeight;
    CGFloat singleViewWidth;
    CGFloat leftSpace;
    CGFloat screenHeight;
    CGSize viewSize;
}

@property (strong,nonatomic) PLLoginViewModel *viewModel;

@property (strong,nonatomic) UIScrollView *baseScrollView;

@property (strong,nonatomic)UIView *topBaseWhiteView;

@property (strong,nonatomic) PLLoginInputIdentityNumberTextField *nameField;

@property (strong,nonatomic) PLLoginInputIdentityNumberTextField *identityField;

@property (strong,nonatomic) PLLoginInputIdentityNumberTextField *telephoneField;

@property (strong,nonatomic) PLRegisterInputCodeView *codeField;

@property (strong,nonatomic) PLLoginInputPasswordTextFieldView *passwordField;

@property (strong,nonatomic) PLLoginInputPasswordTextFieldView *surePassWordNameField;

@property (strong,nonatomic) PLCustomLabel *tipLabel;

@property (strong,nonatomic) PLCommonCornerButtonView *sureButtonView;

@end

@implementation PLRegisterRootView

- (instancetype)initWithFrame:(CGRect)frame withViewModel:(PLLoginViewModel*)viewModel
{
    self = [super initWithFrame:frame];
    if (self)
    {
        viewSize = CGSizeMake(frame.size.width, frame.size.height);
        screenHeight = SCREEN_HEIGHT;
        singleViewHeight = ceilf(screenHeight * 0.074);
        leftSpace = 15;
        singleViewWidth = frame.size.width - leftSpace * 2;
        self.viewModel = viewModel;
        [self addViews];
    }
    return self;
}

- (void)addViews
{
    self.topBaseWhiteView.backgroundColor = [UIColor whiteColor];
    self.nameField.textFieldView.textField.placeholder = @"请输入真实姓名";
    self.identityField.textFieldView.textField.placeholder = @"请输入身份证号";
    self.telephoneField.textFieldView.textField.placeholder = @"请输入手机号";
    self.codeField.textFieldView.textField.placeholder = @"请输入验证码";
    
    self.passwordField.textFieldView.textField.placeholder = @"请输入新密码";
    self.surePassWordNameField.textFieldView.textField.placeholder = @"请输入确认密码";
    
    self.tipLabel.text = @"提示：密码长度6-20位，同时包含数字、大小写字母、特殊字符中的三种";
    self.tipLabel.numberOfLines = 0;
    
    self.sureButtonView.titleLabel.text = @"确定";
    self.sureButtonView.titleLabel.font = [UIFont getPingFangRegularFont:16];
    self.sureButtonView.titleLabel.backgroundColor = [UIColor colorWithHexString:@"#4071FF"];
    self.sureButtonView.titleLabel.textColor = [UIColor whiteColor];
    
    
    self.baseScrollView.backgroundColor = [UIColor colorWithRed:247 / 255.0 green:247 / 255.0 blue:247 / 255.0 alpha:1.0];
    [self addSubview:self.baseScrollView];
    [self.baseScrollView addSubview:self.topBaseWhiteView];
    [self.baseScrollView addSubview:self.nameField];
    [self.baseScrollView addSubview:self.identityField];
    [self.baseScrollView addSubview:self.telephoneField];
    [self.baseScrollView addSubview:self.codeField];
    [self.baseScrollView addSubview:self.passwordField];
    [self.baseScrollView addSubview:self.surePassWordNameField];
    [self.baseScrollView addSubview:self.tipLabel];
    [self.baseScrollView addSubview:self.sureButtonView];
    
    [self.baseScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.mas_equalTo(self);
    }];
    [self.topBaseWhiteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(self.baseScrollView);
        make.width.mas_equalTo(viewSize.width);
        make.height.mas_equalTo(singleViewHeight * 6);
    }];
    
    
    [self.nameField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.baseScrollView).mas_offset(leftSpace);
        make.width.mas_equalTo(singleViewWidth);
        make.top.mas_equalTo(self.baseScrollView);
        make.height.mas_equalTo(singleViewHeight);
    }];
    [self.identityField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.baseScrollView).mas_offset(leftSpace);
        make.width.mas_equalTo(singleViewWidth);
        make.top.mas_equalTo(self.nameField.mas_bottom);
        make.height.mas_equalTo(singleViewHeight);
    }];
    [self.telephoneField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.baseScrollView).mas_offset(leftSpace);
        make.width.mas_equalTo(singleViewWidth);
        make.top.mas_equalTo(self.identityField.mas_bottom);
        make.height.mas_equalTo(singleViewHeight);
    }];
    
    [self.codeField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.baseScrollView).mas_offset(leftSpace);
        make.width.mas_equalTo(singleViewWidth);
        make.top.mas_equalTo(self.telephoneField.mas_bottom);
        make.height.mas_equalTo(singleViewHeight);
    }];
    
    [self.passwordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.baseScrollView).mas_offset(leftSpace);
        make.width.mas_equalTo(singleViewWidth);
        make.top.mas_equalTo(self.codeField.mas_bottom);
        make.height.mas_equalTo(singleViewHeight);
    }];
    
    [self.surePassWordNameField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.baseScrollView).mas_offset(leftSpace);
        make.width.mas_equalTo(singleViewWidth);
        make.top.mas_equalTo(self.passwordField.mas_bottom);
        make.height.mas_equalTo(singleViewHeight);
    }];
    
    
    CGFloat tipLabelHeight = [self.tipLabel.text getStringHeightWithFont:[UIFont getPingFangRegularFont:14] width:singleViewWidth];
    [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.baseScrollView).mas_offset(leftSpace);
        make.width.mas_equalTo(singleViewWidth);
        make.top.mas_equalTo(self.surePassWordNameField.mas_bottom).mas_offset(10);
        make.height.mas_equalTo(tipLabelHeight);
    }];
    
    [self.sureButtonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.baseScrollView).mas_offset(leftSpace);
        make.width.mas_equalTo(self.sureButtonView.width);
        make.top.mas_equalTo(self.tipLabel.mas_bottom).mas_offset(30);
        make.height.mas_equalTo(self.sureButtonView.height);
    }];
    
    [self.baseScrollView setContentSize:CGSizeMake(viewSize.width, singleViewHeight * 6 + tipLabelHeight + 10 + 30 + self.sureButtonView.height + 10)];
    
    //logic
    WS(weakSelf);
    self.codeField.clickSendCodeButtonBlock = ^{
        [weakSelf clickSendCodeButton];
    };
    self.viewModel.codeSendSuccessBlock = ^{
        [weakSelf.codeField changeDisplayWhenCodeSendSuccess];
    };
    self.sureButtonView.clickButtonBlock = ^{
        [weakSelf clickSureButtonHandler];
    };
    
}

- (void)clickSendCodeButton
{
    self.viewModel.telephoneStr = self.telephoneField.textFieldView.textField.text;
    [self.viewModel clickSendCodeButton];
}

- (void)clickSureButtonHandler
{
    self.viewModel.nameStr = self.nameField.textFieldView.textField.text;
    self.viewModel.identityStr = self.identityField.textFieldView.textField.text;
    self.viewModel.telephoneStr = self.telephoneField.textFieldView.textField.text;
    self.viewModel.codeStr = self.codeField.textFieldView.textField.text;
    self.viewModel.passStr = self.passwordField.textFieldView.textField.text;
    self.viewModel.surePassStr = self.surePassWordNameField.textFieldView.textField.text;
    [self.viewModel registerRequest];
}

-(UIScrollView *)baseScrollView
{
    if (_baseScrollView == nil)
    {
        _baseScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, viewSize.width, viewSize.height)];
    }
    return _baseScrollView;
}

-(UIView *)topBaseWhiteView
{
    if (_topBaseWhiteView == nil)
    {
        _topBaseWhiteView = [[UIView alloc]init];
    }
    return _topBaseWhiteView;
}

-(PLLoginInputIdentityNumberTextField *)nameField
{
    if (_nameField == nil)
    {
        _nameField = [[PLLoginInputIdentityNumberTextField alloc]initWithFrame:CGRectMake(0, 0, singleViewWidth, singleViewHeight)];
    }
    return _nameField;
}

-(PLLoginInputIdentityNumberTextField *)identityField
{
    if (_identityField == nil)
    {
        _identityField = [[PLLoginInputIdentityNumberTextField alloc]initWithFrame:CGRectMake(0, 0, singleViewWidth, singleViewHeight)];
    }
    return _identityField;
}
-(PLLoginInputIdentityNumberTextField *)telephoneField
{
    if (_telephoneField == nil)
    {
        _telephoneField = [[PLLoginInputIdentityNumberTextField alloc]initWithFrame:CGRectMake(0, 0, singleViewWidth, singleViewHeight)];
    }
    return _telephoneField;
}

-(PLRegisterInputCodeView *)codeField
{
    if (_codeField == nil)
    {
        _codeField = [[PLRegisterInputCodeView alloc]initWithFrame:CGRectMake(0, 0, singleViewWidth, singleViewHeight)];
    }
    return _codeField;
}

-(PLLoginInputPasswordTextFieldView *)passwordField
{
    if (_passwordField == nil)
    {
        _passwordField = [[PLLoginInputPasswordTextFieldView alloc]initWithFrame:CGRectMake(0, 0, singleViewWidth, singleViewHeight)];
    }
    return _passwordField;
}

-(PLLoginInputPasswordTextFieldView *)surePassWordNameField
{
    if (_surePassWordNameField == nil)
    {
        _surePassWordNameField = [[PLLoginInputPasswordTextFieldView alloc]initWithFrame:CGRectMake(0, 0, singleViewWidth, singleViewHeight)];
    }
    return _surePassWordNameField;
}

-(PLCustomLabel *)tipLabel
{
    if (_tipLabel == nil)
    {
        _tipLabel = [[PLCustomLabel alloc]initWithCustomerParamer:[UIFont getPingFangRegularFont:14] titleColor:[UIColor colorWithHexString:@"#999999"] aligement:0];
    }
    return _tipLabel;
}

-(PLCommonCornerButtonView *)sureButtonView
{
    if (_sureButtonView == nil)
    {
        _sureButtonView = [[PLCommonCornerButtonView alloc]initWithFrame:CGRectMake(0, 0, singleViewWidth, screenHeight * 0.067)];
    }
    return _sureButtonView;
}


@end
