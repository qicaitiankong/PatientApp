//
//  ZHStudent+Study.m
//  PatientApp
//
//  Created by Lizihao Li on 2021/2/6.
//

#import "ZHStudent+Study.h"

@implementation ZHStudent (Study)

+(void)load{
    NSLog(@"%s",__func__);
}

//+(void)initialize{
//    NSLog(@"%s",__func__);
//}


-(void)life{
    NSLog(@"ZHStudent (Study) -(void)life");
}

+(void)life{
    NSLog(@"ZHStudent (Study) +(void)life");
}


@end
