//
//  UIView+PLCustom.h
//  PatientApp
//
//  Created by mac on 2020/10/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (PLCustom)


/// 画圆角
/// @param targetView 目标view
/// @param size 圆角大小
+ (void)addCornerEffect:(UIView*)targetView cornerRadisSize:(CGSize)size;

/**
 给view设置渐变图层

 @param colors 设置渐变颜色 @[(id)[UIColor colorWithHexString:@"90D9E6"].CGColor,(id)[UIColor colorWithHexString:@"91D3E9"].CGColor]
 @param locations 颜色的起点位置，递增，并且数量跟颜色数量相等 @[@0.0, @0.5, @1, @0.5]
 @param startPoint CGPointMake(0, 0)
 @param endPoint CGPointMake(1, 0)
 @param frame 设置显示的frame
 */
- (void)setGradientLayerWithColors:(NSArray *)colors locations:(NSArray *)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint frame:(CGRect)frame;

@end

NS_ASSUME_NONNULL_END
