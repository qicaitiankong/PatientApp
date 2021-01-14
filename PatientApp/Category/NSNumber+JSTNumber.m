//
//  NSNumber+JSTNumber.m
//  JSTEACHER
//
//  Created by 金石 on 2020/1/2.
//  Copyright © 2020 金石教育-cy. All rights reserved.
//

#import "NSNumber+JSTNumber.h"

@implementation NSNumber (JSTNumber)

+ (BOOL)getResultBoolBySeverBool:(NSNumber*)orinalBool
{
    if ([orinalBool isKindOfClass:[NSNumber class]])
    {
        return orinalBool.boolValue;
    }
    return NO;
}

+ (NSNumber*)getResultNumberByServerNumber:(NSNumber*)orinalNumber
{
    if ([orinalNumber isKindOfClass:[NSNumber class]])
    {
        return orinalNumber;
    }
    return [NSNumber numberWithInteger:0];
}


@end
