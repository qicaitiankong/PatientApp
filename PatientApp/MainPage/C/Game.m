//
//  Game.m
//  PatientApp
//
//  Created by Lizihao Li on 2021/2/3.
//


#import "Game.h"
#import "Person.h"
#import <objc/runtime.h>


typedef enum:NSUInteger{
    ThisRPGGame = 0,
    ThisActionGame = 1,
    ThisBattleFlagGame = 2,
}ThisGameType;

@interface Game ()

@property (copy,nonatomic) NSString *Name;
@property (assign,nonatomic) ThisGameType myType;

@end

@implementation Game

-(void)GiveThisGameName:(NSString*)name{
    self.Name = name;
}

- (void)GiveThisGameType:(ThisGameType)type{
    self.myType = type;
}

- (void)play{
    NSLog(@"测试");
}

+(BOOL)resolveInstanceMethod:(SEL)sel{
    if (sel == @selector(DoThings:Num:)){
        class_addMethod([self class], sel, (IMP)myMethodIMP, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
    /*
     BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types);
     cls:方法添加的目标类
     name:要添加的方法实现对应的SEL
     imp:方法实现，至少包括两个参数：self and _cmd.
     types:描述方法参数类型的字符数组
     */
}

void myMethodIMP(id self, SEL _cmd,NSString *name,int num)
{
    NSLog(@"动态为DoThings添加的方法实现 name=%@ num=%d",name,num);
    
}

// 第二步 如果第一步未处理，那么让别的对象去处理这个方法
//- (id)forwardingTargetForSelector:(SEL)aSelector
//{
//    if ([NSStringFromSelector(aSelector) isEqualToString:@"DoThings:Num:"])
//    {
//        return [[Person alloc]init];
//    }
//    return [super forwardingTargetForSelector:aSelector];
//}
//
///*
// 第三步 如果前两步未处理，这是最后处理的机会将目标函数以其他形式执行
// */
//
//- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
//    NSString *selStr = NSStringFromSelector(aSelector);
//    if ([selStr isEqualToString:@"DoThings:Num:"])
//    {
//        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
//    }else
//    {
//        return [super methodSignatureForSelector:aSelector];
//    }
//}
//
//- (void)forwardInvocation:(NSInvocation *)anInvocation{
//    SEL aSelector = [anInvocation selector];
//    if ([NSStringFromSelector(aSelector) isEqualToString:@"DoThings:Num:"])
//    {
//        //修改接受者对象
//        //[anInvocation invokeWithTarget:[[Person alloc]init]];
//        //或者修改方法名字
//        anInvocation.selector = @selector(fish);
//        [anInvocation invokeWithTarget:self];
//    }
//}
//
//- (void)fish{
//    NSLog(@"fish 方法代替dothins方法");
//}


@end
