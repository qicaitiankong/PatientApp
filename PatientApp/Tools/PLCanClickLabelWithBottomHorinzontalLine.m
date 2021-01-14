//
//  PLCanClickLabelWithBottomHorinzontalLine.m
//  PatientApp
//
//  Created by mac on 2020/10/15.
//

#import "PLCanClickLabelWithBottomHorinzontalLine.h"

@interface PLCanClickLabelWithBottomHorinzontalLine ()

@property (strong,nonatomic) UIView *bottomLine;

@property (strong,nonatomic) UIButton *backbutton;

@end

@implementation PLCanClickLabelWithBottomHorinzontalLine

- (instancetype)initWithFrame:(CGRect)frame labelHeight:(CGFloat)height localTitleStr:(NSString*)titleStr localFont:(UIFont*)font localTextColor:(UIColor*)textColor localLineColor:(UIColor*)lineColor
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.titleLabel.text = titleStr;
        self.titleLabel.font = font;
        self.titleLabel.textColor = textColor;
        [self addSubview:self.titleLabel];
        
        self.bottomLine.backgroundColor = lineColor;
        [self addSubview:self.bottomLine];
        [self addSubview:self.backbutton];
        [self.backbutton addTarget:self action:@selector(clickButtonHandler) forControlEvents:UIControlEventTouchUpInside];
        
        CGFloat labelWidth = [titleStr getStringWidthWithFont:font height:height];
        self.titleLabel.frame = CGRectMake(0, 0, labelWidth, height);
        self.bottomLine.frame = CGRectMake(0, self.titleLabel.bottom + 1, labelWidth, 1);
        self.backbutton.frame = CGRectMake(0, 0, labelWidth, height);
        [self setFrame:CGRectMake(frame.origin.x, frame.origin.y, self.backbutton.width, self.backbutton.height)];
    }
    return self;
}

- (void)clickButtonHandler
{
    if (self.clickButtonBlock)
    {
        self.clickButtonBlock();
    }
}


-(UILabel *)titleLabel
{
    if (_titleLabel == nil)
    {
        _titleLabel = [[UILabel alloc]init];
    }
    return _titleLabel;
}

-(UIView *)bottomLine
{
    if (_bottomLine == nil)
    {
        _bottomLine = [[UIView alloc]init];
    }
    return _bottomLine;
}

-(UIButton *)backbutton
{
    if (_backbutton == nil)
    {
        _backbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _backbutton;
}


@end
