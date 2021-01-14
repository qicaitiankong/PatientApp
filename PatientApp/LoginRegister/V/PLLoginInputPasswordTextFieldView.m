//
//  PLLoginInputPasswordTextFieldView.m
//  PatientApp
//
//  Created by mac on 2020/10/15.
//

#import "PLLoginInputPasswordTextFieldView.h"

@interface PLLoginInputPasswordTextFieldView ()
{
    CGSize viewSize;
    BOOL eyeIsShow;
}

@property (strong,nonatomic) UIImageView *eyeImageView;

@property (strong,nonatomic) UIButton *eyeButton;

@end

@implementation PLLoginInputPasswordTextFieldView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        CGFloat screenHeight = SCREEN_HEIGHT;
        self.backgroundColor = [UIColor whiteColor];
        viewSize = CGSizeMake(frame.size.width, frame.size.height);
        
        [self.eyeImageView setImage:[UIImage imageNamed:@"icon_hide"]];
        [self addSubview:self.eyeImageView];
        
        [self.eyeButton addTarget:self action:@selector(clickEyeButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.eyeButton];
        
        self.textFieldView.textField.secureTextEntry = YES;
        [self addSubview:self.textFieldView];
        
        self.textFieldBottomLine.backgroundColor = [UIColor colorWithHexString:@"#EEEEEE"];
        [self addSubview:self.textFieldBottomLine];
        
        [self.eyeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self);
            make.width.height.mas_equalTo(screenHeight * 0.03);
            make.centerY.mas_equalTo(self);
        }];
        
        [self.eyeButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.eyeImageView).mas_offset(-5);
            make.right.mas_equalTo(self);
            make.top.mas_equalTo(self.eyeImageView.mas_top).mas_offset(-5);
            make.bottom.mas_equalTo(self.eyeImageView).mas_offset(5);
        }];
        
        
        [self.textFieldView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.mas_equalTo(self);
            make.right.mas_equalTo(self.eyeButton.mas_left).mas_offset(-20);
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

-(void)clickEyeButton:(UIButton*)_b
{
    eyeIsShow = !eyeIsShow;
    if (eyeIsShow)
    {
        self.textFieldView.textField.secureTextEntry = NO;
        [self.eyeImageView setImage:[UIImage imageNamed:@"icon_show"]];
    }else
    {
        self.textFieldView.textField.secureTextEntry = YES;
        [self.eyeImageView setImage:[UIImage imageNamed:@"icon_hide"]];
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

-(UIImageView *)eyeImageView
{
    if (_eyeImageView == nil)
    {
        _eyeImageView = [[UIImageView alloc]init];
    }
    return _eyeImageView;
}

-(UIButton *)eyeButton
{
    if (_eyeButton == nil)
    {
        _eyeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _eyeButton;
}

@end
