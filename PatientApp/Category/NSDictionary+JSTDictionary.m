//
//  NSDictionary+JSTDictionary.m
//  JSTEACHER
//
//  Created by 金石 on 2020/1/2.
//  Copyright © 2020 金石教育-cy. All rights reserved.
//

#import "NSDictionary+JSTDictionary.h"

@implementation NSDictionary (JSTDictionary)

+ (NSDictionary*)getResultDictionaryBySeverDictionary:(NSDictionary*)orinalDictionary
{
    NSDictionary *localOrinalDictionary = orinalDictionary;
    if ([localOrinalDictionary isKindOfClass:[NSDictionary class]])
    {
        if (localOrinalDictionary.allKeys.count)
        {
            return localOrinalDictionary;
        }
    }else
    {
        localOrinalDictionary = @{};
    }
    return @{};
}

- (NSString*)acquireStringValueByKey:(NSString*)keyValue
{
    if ([[self allKeys] containsObject:keyValue])
    {
        NSString *valueStr = [NSString getResultStrBySeverStr:[self objectForKey:keyValue]];
        return valueStr;
    }else
    {
        return @"";
    }
    return @"";
}

- (NSNumber*)acquireNumberValueByKey:(NSString*)keyValue
{
    if ([[self allKeys] containsObject:keyValue])
    {
        NSNumber *numberValue = [NSNumber getResultNumberByServerNumber:self[keyValue]];
        return numberValue;
    }else
    {
        return [NSNumber numberWithInteger:0];
    }
     return [NSNumber numberWithInteger:0];
}

- (BOOL)acquireBoolValueByKey:(NSString*)keyValue
{
    if ([[self allKeys] containsObject:keyValue])
    {
        return [NSNumber getResultBoolBySeverBool:self[keyValue]];
    }else
    {
        return NO;
    }
    return NO;
}

- (NSArray *)acquireArrayValueByKey:(NSString*)keyValue
{
    if ([[self allKeys] containsObject:keyValue])
    {
        NSArray *valueArr = self[keyValue];
        if ([valueArr isKindOfClass:[NSArray class]])
        {
            return valueArr;
        }else
        {
            return @[];
        }
    }else
    {
        return @[];
    }
    return @[];
}

@end
