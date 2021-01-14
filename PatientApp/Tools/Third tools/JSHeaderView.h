//
//  JSHeaderView.h
//  JSEDU
//
//  Created by 金石 on 2018/6/19.
//  Copyright © 2018年 孔祥刚. All rights reserved.
//
//默认header

//#import "JSBasicView.h"

/**
 点击效果

 @param left 是否是左边的
 */
typedef void(^JSHeaderViewBlock)(BOOL left);

@interface JSHeaderView : UIView



/**
 自定义颜色初始化

 @param frame 大小
 @param backgroundColor 颜色
 @return header
 */
- (instancetype _Nullable )initWithFrame:(CGRect)frame backgroundColor:(nullable UIColor *)backgroundColor;


/**
 设置默认图片
 */
- (void)setLeftButtonDefaultImage;



/**
 给左边的按钮设置阴影
 */
- (void)setLeftButtonShadow;



/**
 给右边的按钮设置阴影
 */
- (void)setRightButtonShadow;


/**
 底部的线
 */
@property (retain,nonatomic) UIView * _Nullable bottomSep;

/**
 左边的按钮
 */
@property (retain,nonatomic) UIButton * _Nullable leftButton;



/**
 标题
 */
@property (retain,nonatomic) UILabel * _Nullable title;


/**
 右边的按钮
 */
@property (retain,nonatomic) UIButton * _Nonnull rightButton;

/**
 点击了按钮
 */
@property (copy,nonatomic) JSHeaderViewBlock _Nullable click;

@end
