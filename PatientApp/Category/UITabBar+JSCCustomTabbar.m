//
//  UITabBar+JSCCustomTabbar.m
//  JSEDU
//
//  Created by 金石教育 on 2019/8/13.
//  Copyright © 2019 金石教育. All rights reserved.
//

#import "UITabBar+JSCCustomTabbar.h"

@implementation UITabBar (JSCCustomTabbar)
-(id<CAAction>)actionForLayer:(CALayer *)layer forKey:(NSString *)event{
    if ([event isEqualToString:@"position"]) {
        if(layer.position.x<0){
            //show tabbar
            CATransition *pushFromTop = [[CATransition alloc] init];
            pushFromTop.duration = 0.3;
            pushFromTop.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            pushFromTop.type = kCATransitionPush;
            pushFromTop.subtype = kCATransitionFromTop;
            return pushFromTop;
        }else if (layer.position.x>0&&(layer.position.y>layer.bounds.size.height)&&(layer.position.y<[UIScreen mainScreen].bounds.size.height)){
            //hide tabbar
            CATransition *pushFromBottom = [[CATransition alloc] init];
            pushFromBottom.duration = 0.3;
            pushFromBottom.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            pushFromBottom.type = kCATransitionPush;
            pushFromBottom.subtype = kCATransitionFromBottom;
            return pushFromBottom;
        }
    }
    return (id<CAAction>)[NSNull null];
}

-(void)runActionForKey:(NSString *)event object:(id)anObject arguments:(NSDictionary *)dict{
    
}

@end
