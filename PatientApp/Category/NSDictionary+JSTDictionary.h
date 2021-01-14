//
//  NSDictionary+JSTDictionary.h
//  JSTEACHER
//
//  Created by 金石 on 2020/1/2.
//  Copyright © 2020 金石教育-cy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSNumber+JSTNumber.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (JSTDictionary)

/**
 获取字典
 
 @param orinalDictionary 原始字典
 @return 滤空字典
 */
+ (NSDictionary*)getResultDictionaryBySeverDictionary:(NSDictionary*)orinalDictionary;

/**
 获取字典中某个键的值，如果没有对应的键，则返回空字符串（只针对于取字符串类型值）

 @param keyValue 键
 @return 字符串值
 */
- (NSString*)acquireStringValueByKey:(NSString*)keyValue;

/**
 获取字典中某个键的值，如果没有对应的键，则返回0（只针对于取NSNumber类型值）

 @param keyValue 键
 @return number 类型对象
 */
- (NSNumber*)acquireNumberValueByKey:(NSString*)keyValue;

/**
 获取字典中某个键的值，如果没有对应的键，则返回NO（只针对于取BOOL类型值）

 @param keyValue 键
 @return 布尔值
 */
- (BOOL)acquireBoolValueByKey:(NSString*)keyValue;


/**
 获取字典中某个键的值，如果没有对应的键，则返回@[]（只针对于取数组值）

 @param keyValue 键
 @return 数组
 */
- (NSArray *)acquireArrayValueByKey:(NSString*)keyValue;

@end

NS_ASSUME_NONNULL_END
