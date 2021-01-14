//
//  UIFont+JSFont.h
//  JSEDU
//
//  Created by 金石 on 2018/5/8.
//  Copyright © 2018年 孔祥刚. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (JSFont)

/**
 获取自定义平方字体
 */
+ (UIFont *)getPingFangRegularFont:(CGFloat)size;
/**
 获取自定义加粗平方字体
 */
+ (UIFont *)getBoldPingFangRegularFont:(CGFloat)size;
@end
