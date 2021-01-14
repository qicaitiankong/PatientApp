//
//  PLMyPageSingleSelectionView.m
//  PatientApp
//
//  Created by mac on 2020/10/13.
//

#import "PLMyPageSingleSelectionView.h"

@interface PLMyPageSingleSelectionView()
{
    UIImageView *rightFlagImageView;
}

@end

@implementation PLMyPageSingleSelectionView
@synthesize backButton;
@synthesize bottomLineView;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self addViews];
        
    }
    return self;
}

- (void)clickButton:(UIButton*)_b
{
    if (self.clickButtonBlock)
    {
        self.clickButtonBlock(_b);
    }
}

- (void)addViews
{
    self.leftImageView = [[UIImageView alloc]init];
    self.leftImageView.backgroundColor = [UIColor whiteColor];
    
    self.centerLabel = [[PLCustomLabel alloc]initWithCustomerParamer:[UIFont systemFontOfSize:16] titleColor:[UIColor colorWithHexString:@"#262626"] aligement:0];
    
    rightFlagImageView = [[UIImageView alloc]init];
    [rightFlagImageView setImage:[UIImage imageNamed:@"arrow-gray-right"]];
    
    bottomLineView = [[UIView alloc]init];
    bottomLineView.backgroundColor = [UIColor colorWithHexString:@"#EEEEEE"];
    
    backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:rightFlagImageView];
    [self addSubview:self.leftImageView];
    [self addSubview:self.centerLabel];
    
    [self addSubview:bottomLineView];
    [self addSubview:backButton];
    
    [rightFlagImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(15);
        make.right.mas_equalTo(self).mas_offset(0);
        make.centerY.mas_equalTo(self);
    }];
    
    [self.leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).mas_offset(0);
        make.width.height.mas_equalTo(18);
        make.centerY.mas_equalTo(self);
    }];
    
    [self.centerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.leftImageView.mas_right).mas_offset(10);
        make.right.mas_equalTo(rightFlagImageView.mas_left).mas_offset(-20);
        make.height.mas_equalTo(16);
        make.centerY.mas_equalTo(self);
    }];
    
    [bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.leftImageView);
        make.right.mas_equalTo(rightFlagImageView.mas_right);
        make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-1);
        make.height.mas_equalTo(1);
    }];
    
    [backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(0);
    }];
    
}


@end
