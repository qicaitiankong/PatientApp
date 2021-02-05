//
//  RuntimeStudent+Zh.m
//  PatientApp
//
//  Created by Lizihao Li on 2021/2/4.
//

#import "RuntimeStudent+Zh.h"
#import <objc/runtime.h>


@implementation RuntimeStudent (Zh)

+ (void)load{
    static dispatch_once_t onceToken;
    //单例
    dispatch_once(&onceToken, ^{
        NSLog(@"方法交换执行");
        Method method01 = class_getInstanceMethod([self class], @selector(test));
        Method method02 = class_getInstanceMethod([self class], @selector(zhStudentMethod));
        
        method_exchangeImplementations(method01, method02);

        /* method_exchangeImplementations方法内部实现：语句：
         {
             IMP imp1 = method_getImplementation(m1);
             IMP imp2 = method_getImplementation(m2);
             method_setImplementation(m1, imp2);
             method_setImplementation(m2, imp1);
         }
         */
    });
}
- (void)zhStudentMethod{
    NSLog(@"RuntimeStudent 分类中添加的方法:%s",__func__);
    //再执行原来的方法
    [self zhStudentMethod];
}

@end
