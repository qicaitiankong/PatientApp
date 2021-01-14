//
//  JSHeaderView.m
//  JSEDU
//
//  Created by 金石 on 2018/6/19.
//  Copyright © 2018年 孔祥刚. All rights reserved.
//

#import "JSHeaderView.h"

@interface JSHeaderView ()
@property (copy,nonatomic) NSString *titleStr;



@end

@implementation JSHeaderView



/**
 如果是iOS11以上的系统，返回safeAreaInsets，否则不返回

 @param view 当前控制器的view
 @return safeAreaInsets
 */
static inline UIEdgeInsets sgm_safeAreaInset(UIView *view) {
    if (@available(iOS 11.0, *)) {
        return view.safeAreaInsets;
    }
    return UIEdgeInsetsZero;
}


- (instancetype)init {
    self = [super init];
    if (self) {
        [self setGradientLayerWithFrame:CGRectZero];
        [self setupViews];
    }
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame {
    return [self initWithFrame:frame backgroundColor:nil];
}




- (instancetype)initWithFrame:(CGRect)frame backgroundColor:(nullable UIColor *)backgroundColor {
    self = [super initWithFrame:frame];
    if (self) {
        if (backgroundColor) {
            self.backgroundColor = backgroundColor;
        } else {
            [self setGradientLayerWithFrame:frame];
        }
        
        [self setupViews];
    }
    return self;
}






- (void)setGradientLayerWithFrame:(CGRect)frame {
    //[self setGradientLayerWithColors:@[(id)[UIColor colorWithHexString:@"90D9E6"].CGColor,(id)[UIColor colorWithHexString:@"91D3E9"].CGColor] locations:@[@0.0, @0.5, @1, @0.5] startPoint:CGPointMake(0, 0) endPoint:CGPointMake(1, 0) frame:CGRectMake(0, 0, SCREEN_WIDTH, frame.size.height)];
}



- (void)setupViews {
    
    self.title = [UILabel new];
    self.title.font = [UIFont systemFontOfSize:16];
    self.title.textColor = [UIColor colorWithHexString:@"333333"];
    self.title.textAlignment = NSTextAlignmentCenter;
    self.title.text = self.titleStr;
    [self addSubview:self.title];
    
    self.leftButton = [UIButton new];
    [self.leftButton addTarget:self action:@selector(clickLeftButton) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.leftButton];
    
    self.rightButton = [UIButton new];
    [self.rightButton addTarget:self action:@selector(clickRightButton) forControlEvents:UIControlEventTouchUpInside];
    self.rightButton.contentEdgeInsets = UIEdgeInsetsMake(IPHONE_STATUSBAR_HEIGHT, 0, 0, 0);
    [self addSubview:self.rightButton];

    
    //底部的线
    self.bottomSep = [UIView new];
    self.bottomSep.backgroundColor = [UIColor colorWithHexString:@"E1E1E1" alpha:0.5];
    [self addSubview:self.bottomSep];
}

- (void)setLeftButtonDefaultImage {
//    [self.leftButton setImage:[UIImage imageNamed:@"icon_header_back.png"] forState:UIControlStateNormal];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"nav_back_b"]];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.tag = 111;//设置tag值，以便在后面取到这个imageView
    [self.leftButton addSubview:imageView];
}

- (void)setLeftButtonShadow {
    if (self.leftButton) {
        self.leftButton.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
        self.leftButton.layer.shadowOffset = CGSizeMake(-1,2);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
        self.leftButton.layer.shadowOpacity = 0.3;//阴影透明度，默认0
        self.leftButton.layer.shadowRadius = 2;//阴影半径，默认3
    }
}


- (void)setRightButtonShadow {
    if (self.rightButton) {
        self.rightButton.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
        self.rightButton.layer.shadowOffset = CGSizeMake(-1,2);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
        self.rightButton.layer.shadowOpacity = 0.3;//阴影透明度，默认0
        self.rightButton.layer.shadowRadius = 2;//阴影半径，默认3
    }
}


- (void)clickLeftButton {
    if (self.click) {
        self.click(YES);
    }
}

- (void)clickRightButton {
    if (self.click) {
        self.click(NO);
    }
}




- (void)layoutSubviews {
    [super layoutSubviews];

    [self.leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(0);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(IPHONE_NAVIGATIONBAR_HEIGHT);
    }];
    UIImageView *imageView = [self.leftButton viewWithTag:111];
    if (imageView) {
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(16);
            make.bottom.mas_equalTo(0);
            make.size.mas_equalTo( CGSizeMake(15, IPHONE_NAVIGATIONBAR_HEIGHT - IPHONE_STATUSBAR_HEIGHT) );
        }];
    }
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(100);;
        make.right.top.mas_equalTo(0);
        make.height.mas_equalTo(IPHONE_NAVIGATIONBAR_HEIGHT);

    }];
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(IPHONE_NAVIGATIONBAR_HEIGHT-IPHONE_STATUSBAR_HEIGHT);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(IPHONE_STATUSBAR_HEIGHT);
    }];
    [self.bottomSep mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.mas_bottom);
        make.left.mas_equalTo(self.mas_left);
        make.height.mas_equalTo(1);
        make.right.mas_equalTo(self.mas_right);
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
