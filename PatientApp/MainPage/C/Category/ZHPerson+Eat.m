//
//  ZHPerson+Eat.m
//  PatientApp
//
//  Created by Lizihao Li on 2021/2/5.
//

#import "ZHPerson+Eat.h"

@implementation ZHPerson (Eat)

+(void)load{
    NSLog(@"%s",__func__);
}

+(void)initialize{
    NSLog(@"%s",__func__);
}


+ (void)eat{
    NSLog(@"ZHPerson+Eat + (void)eat");
}

- (void)eat{
    NSLog(@"ZHPerson+Eat - (void)eat");
}

-(void)life
{
    NSLog(@"ZHPerson+Eat.h -(void)life");
}

+(void)life
{
     NSLog(@"ZHPerson+Eat.h +(void)life");
}

- (void)test01{
    NSLog(@"Person+Eat test01方法");
}

@end
