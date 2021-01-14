//
//  PLLoginInputIdentityNumberTextField.m
//  PatientApp
//
//  Created by mac on 2020/10/15.
//

#import "PLLoginInputIdentityNumberTextField.h"


@interface PLLoginInputIdentityNumberTextField ()
{
    CGSize viewSize;
}

@end

@implementation PLLoginInputIdentityNumberTextField

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        viewSize = CGSizeMake(frame.size.width, frame.size.height);
        [self addSubview:self.textFieldView];
        
        self.textFieldBottomLine.backgroundColor = [UIColor colorWithHexString:@"#EEEEEE"];
        [self addSubview:self.textFieldBottomLine];
        
        [self.textFieldView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.mas_equalTo(self);
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

@end
