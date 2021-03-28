//
//  ZhLayer.m
//  PatientApp
//
//  Created by Lizihao Li on 2021/3/17.
//

#import "ZhLayer.h"

@implementation ZhLayer

- (void)drawInContext:(CGContextRef)ctx
{
    //提示：在形变坐标系前，记得保存坐标系，使用后再恢复坐标系。
    CGContextSaveGState(ctx);
    //
    //翻转
    CGContextScaleCTM(ctx, 1.0, -2.0);
    //平移
    CGContextTranslateCTM(ctx, 0, - self.bounds.size.height);
    
    UIImage *image = [UIImage imageNamed:@"icon_image_tab"];
    CGContextDrawImage(ctx, CGRectMake(50, 50, 100, 100), image.CGImage);
    CGContextRestoreGState(ctx);
    //画青色的圆
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, 100, 100));
    CGContextSetRGBFillColor(ctx, 0.0, 1.0, 1.0, 1.0);
    CGContextDrawPath(ctx, kCGPathFill);
    // 画蓝色的圆
    
    CGContextAddEllipseInRect(ctx, CGRectMake(100,100, 100, 100));
    CGContextSetRGBFillColor(ctx, 1.0, 0.0, 1.0, 1.0);
    CGContextDrawPath(ctx, kCGPathFill);
    
    
}


@end
