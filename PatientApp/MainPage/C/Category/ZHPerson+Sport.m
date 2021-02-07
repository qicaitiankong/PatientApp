//
//  ZHPerson+Sport.m
//  PatientApp
//
//  Created by Lizihao Li on 2021/2/5.
//

#import "ZHPerson+Sport.h"
#import <objc/runtime.h>



@implementation ZHPerson (Sport)

+(void)load{
    NSLog(@"%s",__func__);
}

+(void)initialize{
    NSLog(@"%s",__func__);
}



-(void)setStepCount:(NSInteger)stepCount{
    objc_setAssociatedObject(self,  @selector(stepCount),[NSNumber numberWithInteger:stepCount], OBJC_ASSOCIATION_ASSIGN);
}

- (NSInteger)stepCount
{
    NSNumber *num = objc_getAssociatedObject(self, @selector(stepCount));
    return num.integerValue;
}

- (void)setStartTime:(NSString *)startTime{
    objc_setAssociatedObject(self, @selector(startTime), startTime, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(NSString *)startTime{
    return objc_getAssociatedObject(self, @selector(startTime));
}



- (void)sport{
    NSLog(@"ZHPerson (Sport) - (void)sport");
}

+ (void)sport{
    NSLog(@"ZHPerson (Sport) + (void)sport");
    
}

- (void)run{
    NSLog(@"ZHPerson (Sport)  -(void)run");
}

+ (void)run{
     NSLog(@"ZHPerson (Sport)  +(void)run");
}

- (void)life{
    NSLog(@"ZHPerson (Sport)  - (void)life");
}

+ (void)life{
    NSLog(@"ZHPerson (Sport)  + (void)life");
}



@end

