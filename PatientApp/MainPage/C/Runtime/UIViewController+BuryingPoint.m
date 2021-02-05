//
//  UIViewController+BuryingPoint.m
//  PatientApp
//
//  Created by Lizihao Li on 2021/2/4.
//

#import "UIViewController+BuryingPoint.h"
#import <objc/runtime.h>

@implementation UIViewController (BuryingPoint)

+(void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //hook_viewWillAppear:去代替原view willAppear 执行
        Method m1 = class_getInstanceMethod([self class], @selector(viewWillAppear:));
        Method m2 = class_getInstanceMethod([self class], @selector(hook_viewWillAppear:));
        method_exchangeImplementations(m1, m2);
        //hook_viewWillDisappear 去代替原来viewWillDisappear
        Method m3 = class_getInstanceMethod([self class], @selector(viewWillDisappear:));
        Method m4 = class_getInstanceMethod([self class], @selector(hook_viewWillDisappear:));
        method_exchangeImplementations(m3, m4);
        
        
    });
}

- (void)hook_viewWillAppear:(BOOL)animated
{
    //先执行目的操作
    NSLog(@"页面将要显示");
    //再执行原 viewWillAppear 方法
    [self hook_viewWillAppear:animated];
}

- (void)hook_viewWillDisappear:(BOOL)animated
{
    //先执行目的操作
    NSLog(@"页面将要消失");
    //再执行原 viewWillDisappear 方法
    [self hook_viewWillDisappear:animated];
}

@end
