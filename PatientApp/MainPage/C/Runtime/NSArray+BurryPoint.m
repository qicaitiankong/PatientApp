//
//  NSArray+BurryPoint.m
//  PatientApp
//
//  Created by Lizihao Li on 2021/2/4.
//

#import "NSArray+BurryPoint.h"
#import <objc/runtime.h>

@implementation NSArray (BurryPoint)
/*
    数组的所有有关真类
    不可变数组元素个数大于1:__NSArrayI
    不可变数组元素个数为0 ： __NSArray0
    不可变数组元素个数为1 =__NSSingleObjectArrayI
    可变数组: __NSArrayM
    */


+ (void)load{
               NSLog(@"数组防止奔溃埋点");
               //交换 不可变数组（元素个数大于1）
               Method m1 = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(objectAtIndex:));
               Method m2 = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(hook_NSArrayI_objectAtIndex:));
               method_exchangeImplementations(m1, m2);
               //下标取值时
               Method m3 = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(objectAtIndexedSubscript:));
               Method m4 = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(hook_NSArrayI_objectAtIndexedSubscript:));
               method_exchangeImplementations(m3, m4);
               //不可变数组元素个数为0
               Method m5 = class_getInstanceMethod(objc_getClass("__NSArray0"), @selector(objectAtIndex:));
               Method m6 = class_getInstanceMethod(objc_getClass("__NSArray0"), @selector(hook_NSArray0_objectAtIndex:));
               method_exchangeImplementations(m5, m6);
               //不可变数组元素个数为1
               Method m9 = class_getInstanceMethod(objc_getClass("__NSSingleObjectArrayI"), @selector(objectAtIndex:));
               Method m10 = class_getInstanceMethod(objc_getClass("__NSSingleObjectArrayI"), @selector(hook_NSSingleObjectArrayI_objectAtIndex:));
               method_exchangeImplementations(m9, m10);
               Method m11 = class_getInstanceMethod(objc_getClass("__NSSingleObjectArrayI"), @selector(objectAtIndexedSubscript:));
               Method m12 = class_getInstanceMethod(objc_getClass("__NSSingleObjectArrayI"), @selector(hook_NSSingleObjectArrayI_objectAtIndexedSubscript:));
               method_exchangeImplementations(m11, m12);
               //可变数组
               Method m13 = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(objectAtIndex:));
               Method m14 = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(hook_NSArrayM_objectAtIndex:));
               method_exchangeImplementations(m13, m14);
               Method m15 = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(objectAtIndexedSubscript:));
               Method m16 = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(hook_NSArrayM_objectAtIndexedSubscript:));
               method_exchangeImplementations(m15, m16);

}

- (id)hook_NSArrayI_objectAtIndex:(NSUInteger)index
{
    //判断下标是否越界，如果越界就进入异常拦截
    if (index > self.count - 1)
    {
       NSLog(@"数组越界埋点信息打印");
       return nil;
    }else
    {
        return [self hook_NSArrayI_objectAtIndex:index];
    }
}

- (id)hook_NSArrayI_objectAtIndexedSubscript:(NSUInteger)index{
    //判断下标是否越界，如果越界就进入异常拦截
    if (index > self.count - 1)
    {
         NSLog(@"数组越界埋点信息打印");
         return nil;
    }else
    {
        return [self hook_NSArrayI_objectAtIndexedSubscript:index];
    }
}

//不可变数组元素个数为0
- (id)hook_NSArray0_objectAtIndex:(NSUInteger)index{
    //判断下标是否越界，如果越界就进入异常拦截,不能用index > self.count -1 判断否则奔溃
    if (index > self.count)
    {
         NSLog(@"数组越界埋点信息打印");
         return nil;
    }else
    {
        return [self hook_NSArray0_objectAtIndex:index];
    }
}

//不可变数组个数为1
- (id)hook_NSSingleObjectArrayI_objectAtIndex:(NSUInteger)index{
    //判断下标是否越界，如果越界就进入异常拦截
    if (index > self.count - 1)
    {
        NSLog(@"数组越界埋点信息打印");
        return nil;
    }else
    {
        return [self hook_NSSingleObjectArrayI_objectAtIndex:index];
    }
}

- (id)hook_NSSingleObjectArrayI_objectAtIndexedSubscript:(NSUInteger)index{
    //判断下标是否越界，如果越界就进入异常拦截
    if (index > self.count - 1)
    {
         NSLog(@"数组越界埋点信息打印");
        return nil;
    }else
    {
        return [self hook_NSSingleObjectArrayI_objectAtIndexedSubscript:index];
    }
}

//可变数组

- (id)hook_NSArrayM_objectAtIndex:(NSUInteger)index{
    //判断下标是否越界，如果越界就进入异常拦截
    if (index > self.count - 1)
    {
         NSLog(@"数组越界埋点信息打印");
        return nil;
    }else
    {
        return [self hook_NSArrayM_objectAtIndex:index];
    }
}

- (id)hook_NSArrayM_objectAtIndexedSubscript:(NSUInteger)index{
    //判断下标是否越界，如果越界就进入异常拦截
    if (index > self.count - 1)
    {
         NSLog(@"数组越界埋点信息打印");
        return nil;
    }else
    {
        return [self hook_NSArrayM_objectAtIndexedSubscript:index];
    }
}


@end
