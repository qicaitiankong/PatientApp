//
//  ZHPerson.m
//  PatientApp
//
//  Created by Lizihao Li on 2021/2/5.
//

#import "ZHPerson.h"

@implementation ZHPerson

+(void)load{
    NSLog(@"%s",__func__);
}

+(void)initialize{
    NSLog(@"%s",__func__);
}


- (void)life{
    NSLog(@"ZHPerson:-(void)life");
}

+ (void)life{
    NSLog(@"ZHPerson:+(void)life");
}

@end
