//
//  PLMyPageTopPartView.m
//  PatientApp
//
//  Created by mac on 2020/10/13.
//

#import "PLMyPageTopPartView.h"

@interface PLMyPageTopPartView ()
{
    UIImageView *backImageView;
    UIButton *userHeaderImageViewBackButton;
    
    CGFloat userHeaderImageViewHeight;

}
@end

@implementation PLMyPageTopPartView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        userHeaderImageViewHeight = ceilf(frame.size.height * 0.36);
        [self addViews];
    }
    return self;
}

- (void)clickUserPhotoButton
{
    if (self.clickButtonBlock)
    {
        self.clickButtonBlock();
    }
}


- (void)addViews
{
    backImageView = [[UIImageView alloc]init];
    [backImageView setImage:[UIImage imageNamed:@"myPageBack"]];
    
    self.userHeaderImageView = [[UIImageView alloc]init];
    self.userHeaderImageView.backgroundColor = [UIColor whiteColor];
    [self.userHeaderImageView setImage:[UIImage imageNamed:@"myPage-add-photo"]];
    self.userHeaderImageView.frame = CGRectMake(0, 0, userHeaderImageViewHeight, userHeaderImageViewHeight);
    self.userHeaderImageView.backgroundColor = [UIColor whiteColor];
    [UIView addCornerEffect:self.userHeaderImageView cornerRadisSize:CGSizeMake(userHeaderImageViewHeight, userHeaderImageViewHeight)];
    
    userHeaderImageViewBackButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [userHeaderImageViewBackButton addTarget:self action:@selector(clickUserPhotoButton) forControlEvents:UIControlEventTouchUpInside];
    
    self.nameLabel = [[PLCustomLabel alloc]initWithCustomerParamer:[UIFont systemFontOfSize:18] titleColor:[UIColor whiteColor] aligement:0];
    
    self.telephoneLabel = [[PLCustomLabel alloc]initWithCustomerParamer:[UIFont systemFontOfSize:15] titleColor:[UIColor whiteColor] aligement:0];

    self.identityNumberLabel = [[PLCustomLabel alloc]initWithCustomerParamer:[UIFont systemFontOfSize:15] titleColor:[UIColor whiteColor] aligement:0];
    
    [self addSubview:backImageView];
   
    [self addSubview:self.userHeaderImageView];
    [self addSubview:userHeaderImageViewBackButton];
    [self addSubview:self.nameLabel];
    [self addSubview:self.telephoneLabel];
    [self addSubview:self.identityNumberLabel];
   
    
    [backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(0);
    }];
    
    [self.userHeaderImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(userHeaderImageViewHeight);
        make.width.mas_equalTo(self.userHeaderImageView.mas_height);
        make.right.mas_equalTo(self).mas_equalTo(-20);
        make.top.mas_equalTo(self).mas_offset(20);
    }];
    
    [userHeaderImageViewBackButton mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.left.right.top.bottom.mas_equalTo(self.userHeaderImageView);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).mas_offset(20);
        make.right.mas_equalTo(self.userHeaderImageView.mas_left).mas_offset(-10);
        make.top.mas_equalTo(self.userHeaderImageView);
        make.height.mas_equalTo(self.userHeaderImageView).multipliedBy(0.5);
    }];
    
    [self.telephoneLabel mas_makeConstraints:^(MASConstraintMaker *make)
     {
        make.left.right.mas_equalTo(self.nameLabel);
        make.top.mas_equalTo(self.nameLabel.mas_bottom);
        make.bottom.mas_equalTo(self.userHeaderImageView);
    }];
    
    [self.identityNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.nameLabel);
        make.right.mas_equalTo(self.mas_right).mas_offset(-20);
        make.height.mas_equalTo(15);
        make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-10);
    }];
    
}



@end
