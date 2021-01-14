//
//  PLCommonCornerButtonView.m
//  PatientApp
//
//  Created by mac on 2020/10/14.
//

#import "PLCommonCornerButtonView.h"

@interface PLCommonCornerButtonView ()

@property (strong,nonatomic) UIButton *backButton;

@end

@implementation PLCommonCornerButtonView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = frame.size.height / 2;
        self.clipsToBounds = YES;

        [self addSubview:self.titleLabel];
        [self addSubview:self.backButton];
        [self.backButton addTarget:self action:@selector(clickButtonHandler:) forControlEvents:UIControlEventTouchUpInside];
        self.titleLabel.backgroundColor = [UIColor whiteColor];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.mas_equalTo(self);
        }];
        [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.mas_equalTo(self);
        }];
        
    }
    return self;
}

- (void)clickButtonHandler:(UIButton*)_b
{
    if (self.clickButtonBlock)
    {
        self.clickButtonBlock();
    }
}

-(PLCustomLabel *)titleLabel
{
    if (_titleLabel == nil)
    {
        _titleLabel = [[PLCustomLabel alloc]initWithCustomerParamer:[UIFont systemFontOfSize:16] titleColor:[UIColor blackColor] aligement:1];
    }
    return _titleLabel;
}

-(UIButton *)backButton
{
    if (_backButton == nil)
    {
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _backButton;
}

@end
