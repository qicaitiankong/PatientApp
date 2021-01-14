//
//  PLMyPageNetWork.h
//  PatientApp
//
//  Created by mac on 2020/10/19.
//

#import <Foundation/Foundation.h>
#import "PLCommonNetworkUrlConstant.h"

NS_ASSUME_NONNULL_BEGIN

@interface PLMyPageNetWork : NSObject

+(void)existLoginRequest:(NSDictionary *)paraDict withBlock:(void(^)(id response))suc withErrorBlock:(void(^)(id response))error;


/// 获取个人信息
/// @param paraDict paraDict description
/// @param suc suc description
/// @param error error description
+(void)getPersonalInfo:(NSDictionary *)paraDict withBlock:(void(^)(id response))suc withErrorBlock:(void(^)(id response))error;


+(void)findPassWordRequest:(NSDictionary *)paraDict withBlock:(void(^)(id response))suc withErrorBlock:(void(^)(id response))error;

+(void)amendPassWordRequest:(NSDictionary *)paraDict withBlock:(void(^)(id response))suc withErrorBlock:(void(^)(id response))error;

@end

NS_ASSUME_NONNULL_END
