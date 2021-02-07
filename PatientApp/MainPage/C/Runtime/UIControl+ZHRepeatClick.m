//
//  UIControl+ZHRepeatClick.m
//  PatientApp
//
//  Created by Lizihao Li on 2021/2/5.
//

#import "UIControl+ZHRepeatClick.h"

@implementation UIControl (ZHRepeatClick)

static const char *UIControl_acceptEventInterval = "UIControl_acceptEventInterval";

static const char *UIcontrol_ignoreEvent = "UIcontrol_ignoreEvent";

-(void)setZh_acceptEventInterval:(NSTimeInterval)zh_acceptEventInterval{
    objc_setAssociatedObject(self, UIControl_acceptEventInterval, @(zh_acceptEventInterval), OBJC_ASSOCIATION_ASSIGN);
}
-(NSTimeInterval)zh_acceptEventInterval{
    return [objc_getAssociatedObject(self, UIControl_acceptEventInterval) doubleValue];
}

-(void)setZh_ignoreEvent:(BOOL)zh_ignoreEvent{
    objc_setAssociatedObject(self, UIcontrol_ignoreEvent, @(zh_ignoreEvent), OBJC_ASSOCIATION_ASSIGN);
}
-(BOOL)zh_ignoreEvent{
    return [objc_getAssociatedObject(self, UIcontrol_ignoreEvent) boolValue];
}

//移除UIcontrol中的所有关联对象(建议按照下面的方法一个个移除)
- (void)removezhAssociateObject{
    objc_removeAssociatedObjects(self);
}

//移除UIControl_acceptEventInterval关联对象
- (void)removeAssociateZh_acceptEventInterval{
    objc_setAssociatedObject(self, UIControl_acceptEventInterval, nil, OBJC_ASSOCIATION_ASSIGN);
}

//移除UIcontrol_ignoreEvent关联对象
- (void)removeAssociateZh_ignoreEvent{
    objc_setAssociatedObject(self, UIcontrol_ignoreEvent, nil, OBJC_ASSOCIATION_ASSIGN);
}

+ (void)load
{
    NSLog(@"uicontroller load方法调用");
    Method m1 = class_getInstanceMethod([self class], @selector(sendAction:to:forEvent:));
    Method m2 = class_getInstanceMethod([self class], @selector(zh_hookSendAction:to:event:));
    method_exchangeImplementations(m1, m2);
}

- (void)zh_hookSendAction:(SEL)action to:(id)target event:(UIEvent*)eve{
    if (self.zh_ignoreEvent){
        return;
    }
    if (self.zh_acceptEventInterval > 0)
    {
        self.zh_ignoreEvent = YES;
        [self performSelector:@selector(setZh_ignoreEvent:) withObject:@(NO) afterDelay:self.zh_acceptEventInterval];
    }
    [self zh_hookSendAction:action to:target event:eve];
    
}


@end
