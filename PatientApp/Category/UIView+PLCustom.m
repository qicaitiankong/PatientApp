//
//  UIView+PLCustom.m
//  PatientApp
//
//  Created by mac on 2020/10/14.
//

#import "UIView+PLCustom.h"

@implementation UIView (PLCustom)

+ (void)addCornerEffect:(UIView*)targetView cornerRadisSize:(CGSize)size
{
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:targetView.bounds byRoundingCorners:UIRectCornerTopLeft|UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerTopRight cornerRadii:size];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    maskLayer.frame = targetView.bounds;
    maskLayer.path = maskPath.CGPath;
    targetView.layer.mask = maskLayer;

}

- (void)setGradientLayerWithColors:(NSArray *)colors locations:(NSArray *)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint frame:(CGRect)frame {
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = frame;
    gradientLayer.colors = colors;
    gradientLayer.locations = locations;
    gradientLayer.startPoint = startPoint;
    gradientLayer.endPoint = endPoint;
    [self.layer addSublayer:gradientLayer];
}

@end
