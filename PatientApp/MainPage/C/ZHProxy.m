//
//  ZHProxy.m
//  PatientApp
//
//  Created by Lizihao Li on 2021/3/15.
//

#import "ZHProxy.h"

@implementation ZHProxy

//获取当前的方法签名
- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel
{
    return [self.target methodSignatureForSelector:sel];;
}
//指定当前消息的处理者
- (void)forwardInvocation:(NSInvocation *)invocation
{
    [invocation invokeWithTarget:self.target];
}



@end
