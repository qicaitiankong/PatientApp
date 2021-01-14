//
//  JSBasicViewController.h
//  JSEDU
//
//  Created by 金石 on 2018/5/8.
//  Copyright © 2018年 孔祥刚. All rights reserved.
//
//view controller 的基类

#import <UIKit/UIKit.h>
#import "JSHeaderView.h"

@interface JSBasicViewController : UIViewController
@property(nonatomic,assign)Boolean isDarkStatusBar;

@property (strong,nonatomic) JSHeaderView *header;


/**
 加载一个自定义颜色的header

 @param backgroundColor 自定义颜色
 */
- (void)showHeaderWithBackgroundColor:(nullable UIColor *)backgroundColor;


/**
 加载一个header 带自定义大小

 @param frame 自定义大小
 */
- (void)showHeaderWithFrame:(CGRect)frame;


/**
 加载一个默认header
 */
- (void)showHeader;


//此页面是否需要登录
@property(nonatomic,assign)Boolean isNeedLoginPage;


@end
