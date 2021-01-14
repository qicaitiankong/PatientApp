//
//  NSNumber+JSTNumber.h
//  JSTEACHER
//
//  Created by 金石 on 2020/1/2.
//  Copyright © 2020 金石教育-cy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSNumber (JSTNumber)


/**
 获取滤空布尔值

 @param orinalBool 原始布尔值
 @return 滤空布尔值
 */
+ (BOOL)getResultBoolBySeverBool:(NSNumber*)orinalBool;


/**
 获取滤空数字number值

 @param orinalNumber 原始number值
 @return 滤空number值,不是number值，会返回初始化值为0的number
 */
+ (NSNumber*)getResultNumberByServerNumber:(NSNumber*)orinalNumber;

@end

NS_ASSUME_NONNULL_END
