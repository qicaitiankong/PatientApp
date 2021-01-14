//
//  UIColor+JSColor.m
//  JSEDU
//
//  Created by 金石 on 2018/5/8.
//  Copyright © 2018年 孔祥刚. All rights reserved.
//

#import "UIColor+JSColor.h"

@implementation UIColor (JSColor)
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha
{
    
    //删除字符串中的空格
    
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    
    if ([cString length] < 6)
        
    {
        
        return [UIColor clearColor];
        
    }
    
    // strip 0X if it appears
    
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    
    if ([cString hasPrefix:@"0X"])
        
    {
        
        cString = [cString substringFromIndex:2];
        
    }
    
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    
    if ([cString hasPrefix:@"#"])
        
    {
        
        cString = [cString substringFromIndex:1];
        
    }
    
    if ([cString length] != 6)
        
    {
        
        return [UIColor clearColor];
        
    }
    // Separate into r, g, b substrings
    
    NSRange range;
    
    range.location = 0;
    
    range.length = 2;
    
    //r
    
    NSString *rString = [cString substringWithRange:range];
    
    //g
    
    range.location = 2;
    
    NSString *gString = [cString substringWithRange:range];
    
    //b
    
    range.location = 4;
    
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    
    unsigned int r, g, b;
    
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}

//默认alpha值为1
+ (UIColor *)colorWithHexString:(NSString *)color
{
    
    return [self colorWithHexString:color alpha:1.0f];
}
-(UIColor *)getTranslucentWithAlpha:(CGFloat)alpha{
    CGFloat r=0,g=0,b=0,a=0;
    if ([self respondsToSelector:@selector(getRed:green:blue:alpha:)])
    {
        [self getRed:&r green:&g blue:&b alpha:&a];
    }
    else
    {
        const CGFloat *components = CGColorGetComponents(self.CGColor);
        r = components[0];
        g = components[1];
        b = components[2];
        a = components[3];
    }
    return [UIColor colorWithRed:r green:g blue:b alpha:alpha];
}

@end
