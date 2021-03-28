//
//  ResponderTestView.m
//  PatientApp
//
//  Created by Lizihao Li on 2021/3/19.
//

#import "ResponderTestView.h"

@implementation ResponderTestView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor redColor];
        //
        UIView *viewB = [[UIView alloc]initWithFrame:CGRectMake(10, 10, 50, 40)];
        viewB.backgroundColor = [UIColor grayColor];
        [self addSubview:viewB];
        //
        UIView *viewC = [[UIView alloc]initWithFrame:CGRectMake(-20, 80, 50, 80)];
        viewC.backgroundColor = [UIColor yellowColor];
        [self addSubview:viewC];
        //
    }
    return self;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    NSLog(@"hitTest withEvent");
    if (self.isUserInteractionEnabled == NO || self.isHidden || self.alpha <= 0.01 )
    {
        return  nil;
    }
    //if ([self pointInside:point withEvent:event])
   // {
        for ( UIView *subView in [self.subviews reverseObjectEnumerator])
        {
            CGPoint convertedPoint = [subView convertPoint:point fromView:self];
            UIView *hitTestView = [subView hitTest:convertedPoint withEvent:event];
            if (hitTestView)
            {
                return hitTestView;
            }
        }
    //}
    //UIView *view = [super hitTest:point withEvent:event];
    return nil;
}

//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
//{
//    NSLog(@"A_view pointInside withEvent");
//    BOOL isInside = [super pointInside:point withEvent:event];
//    NSLog(@"pointInside withEvent isInside=%ld",isInside);
//    return isInside;
//}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"A_touchesBegan");
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"A_touchesMoved");
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"A_touchesEnded");
}



@end
