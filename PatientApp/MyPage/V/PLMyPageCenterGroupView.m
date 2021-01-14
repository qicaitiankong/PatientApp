//
//  PLMyPageCenterGroupView.m
//  PatientApp
//
//  Created by mac on 2020/10/13.
//

#import "PLMyPageCenterGroupView.h"
#import "PLMyPageSingleSelectionView.h"


@interface PLMyPageCenterGroupView ()
{
    NSArray *titleArr;
    
}

@property (strong,nonatomic) NSMutableArray *viewArr;

@end

@implementation PLMyPageCenterGroupView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        titleArr = @[@"个人信息",@"在线客服",@"修改密码",@"版本升级"];
        for (int i = 0; i < titleArr.count; i ++)
        {
            NSString *imageName = [NSString stringWithFormat:@"myPageList0%d",i + 1];
            PLMyPageSingleSelectionView *view = [[PLMyPageSingleSelectionView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, SCREEN_HEIGHT * 0.07)];
            view.backButton.tag = i;
            WS(weakSelf);
            view.clickButtonBlock = ^(UIButton * _Nonnull _b)
            {
                if(weakSelf.clickButtonStyle)
                {
                    weakSelf.clickButtonStyle(_b.tag);
                }
            };
            [self addSubview:view];
            [view.leftImageView setImage:[UIImage imageNamed:imageName]];
            [view.centerLabel setText:titleArr[i]];
            [self.viewArr addObject:view];
            if (i == titleArr.count - 1)
            {
                view.bottomLineView.hidden = YES;
            }
        }
        [self.viewArr mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedItemLength:SCREEN_HEIGHT * 0.07 leadSpacing:0 tailSpacing:0];
        [self.viewArr mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self).mas_offset(15);
            make.right.mas_equalTo(self.mas_right).mas_offset(-15);
        }];
        
    }
    return self;
}

-(NSMutableArray *)viewArr
{
    if (_viewArr == nil)
    {
        _viewArr = [[NSMutableArray alloc]init];
    }
    return _viewArr;
}




@end
