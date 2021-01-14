//
//  PLRegisterInputCodeView.m
//  PatientApp
//
//  Created by mac on 2020/10/15.
//

#import "PLRegisterInputCodeView.h"


@interface PLRegisterInputCodeView ()
{
    CGSize viewSize;
}

@property (strong,nonatomic) UIView *spaceLine;

@property (strong,nonatomic) PLCustomLabel *codeTipLabel;

@property (strong,nonatomic) UIButton *codeButton;

@end

@implementation PLRegisterInputCodeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        viewSize = CGSizeMake(frame.size.width, frame.size.height);
        self.codeTipLabel.text = @"发送验证码";
        [self.codeButton addTarget:self action:@selector(clickCodeButton) forControlEvents:UIControlEventTouchUpInside];
        self.spaceLine.backgroundColor = [UIColor colorWithHexString:@"#EEEEEE"];
        self.textFieldBottomLine.backgroundColor = [UIColor colorWithHexString:@"#EEEEEE"];
        
        [self addSubview:self.codeTipLabel];
        [self addSubview:self.codeButton];
        [self addSubview:self.spaceLine];
        [self addSubview:self.textFieldView];
        [self addSubview:self.textFieldBottomLine];

        CGFloat codeLabelWidth = [self.codeTipLabel.text getStringWidthWithFont:[UIFont getPingFangRegularFont:16] height:20] + 20;
        [self.codeTipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self);
            make.width.mas_equalTo(codeLabelWidth);
            make.height.mas_equalTo(20);
            make.centerY.mas_equalTo(self);
        }];
        
        [self.codeButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.codeTipLabel.mas_top).mas_offset(-5);
            make.left.right.mas_equalTo(self.codeTipLabel);
            make.bottom.mas_equalTo(self.codeTipLabel.mas_bottom).mas_offset(5);
        }];
        
        [self.spaceLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.codeTipLabel.mas_left).mas_offset(-10);
            make.width.mas_equalTo(1);
            make.height.mas_equalTo(24);
            make.centerY.mas_equalTo(self);
        }];
        
        [self.textFieldView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.mas_equalTo(self);
            make.right.mas_equalTo(self.spaceLine.mas_left).mas_offset(-15);
        }];
        [self.textFieldBottomLine mas_makeConstraints:^(MASConstraintMaker *make)
        {
            make.left.right.mas_equalTo(self);
            make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-1);
            make.height.mas_equalTo(1);
        }];
        
    }
    return self;
}

- (void)clickCodeButton
{
    if (self.clickSendCodeButtonBlock)
    {
        self.clickSendCodeButtonBlock();
    }
   
}

-(PLBaseTextField *)textFieldView
{
    if (_textFieldView == nil)
    {
        _textFieldView = [[PLBaseTextField alloc]initWithFrame:CGRectMake(0, 0, viewSize.width, viewSize.height)];
    }
    return _textFieldView;
}

-(UIView *)textFieldBottomLine
{
    if (_textFieldBottomLine == nil)
    {
        _textFieldBottomLine = [[UIView alloc]init];
    }
    return _textFieldBottomLine;
}

-(UIView *)spaceLine
{
    if (_spaceLine == nil)
    {
        _spaceLine = [UIView new];
    }
    return _spaceLine;
}

-(PLCustomLabel *)codeTipLabel
{
    if (_codeTipLabel == nil)
    {
        _codeTipLabel = [[PLCustomLabel alloc]initWithCustomerParamer:[UIFont getPingFangRegularFont:16] titleColor:[UIColor colorWithHexString:@"#385CF2"] aligement:1];
    }
    return _codeTipLabel;
}

-(UIButton *)codeButton
{
    if (_codeButton == nil)
    {
        _codeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _codeButton;
}


- (void)changeDisplayWhenCodeSendSuccess{
    __block int timeout = 59;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                self.codeTipLabel.text = @"重新获取";
                self.codeButton.userInteractionEnabled = YES;
            });
        }else{
            int seconds = timeout % 60;
            NSString *strTime = [NSString stringWithFormat:@"%d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.codeTipLabel.text = [NSString stringWithFormat:@"重发(%@)s",strTime];
                self.codeButton.userInteractionEnabled = NO;
            });
            timeout--;
        }
    });
    
    dispatch_resume(_timer);
}

@end
