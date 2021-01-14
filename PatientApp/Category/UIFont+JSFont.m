//
//  UIFont+JSFont.m
//  JSEDU
//
//  Created by 金石 on 2018/5/8.
//  Copyright © 2018年 孔祥刚. All rights reserved.
//

#import "UIFont+JSFont.h"

@implementation UIFont (JSFont)


#pragma mark 平方字体大小
+ (UIFont *)getPingFangRegularFont:(CGFloat)size {
    return [UIFont fontWithName:@"PingFangSC-Regular" size:size];
}
+ (UIFont *)getBoldPingFangRegularFont:(CGFloat)size {
    return [UIFont fontWithName:@"PingFangSC-Regular-Bold" size:size];
}

@end
