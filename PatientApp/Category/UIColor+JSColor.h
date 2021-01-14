//
//  UIColor+JSColor.h
//  JSEDU
//
//  Created by 金石 on 2018/5/8.
//  Copyright © 2018年 孔祥刚. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (JSColor)
/**
 16进制转UIColor
 
 @param color 16进制数字
 @param alpha 透明度
 @return UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;


/**
 16进制转UIColor 默认透明度1
 
 @param color 16进制数字
 @return UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)color;
/// 获取一个颜色的半透明色
/// @param alpha 透明度  0~1之间的数
-(UIColor *)getTranslucentWithAlpha:(CGFloat)alpha;


@end
