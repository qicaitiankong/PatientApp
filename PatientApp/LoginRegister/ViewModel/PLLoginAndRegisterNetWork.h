//
//  PLLoginAndRegisterNetWork.h
//  PatientApp
//
//  Created by mac on 2020/10/16.
//

#import <Foundation/Foundation.h>
#import "PLCommonNetworkUrlConstant.h"

NS_ASSUME_NONNULL_BEGIN

@interface PLLoginAndRegisterNetWork : NSObject


/// 获取验证码
/// @param telephoneStr 手机号
/// @param suc suc description
/// @param error error description
+(void)getMobileCode:(NSString *)telephoneStr withBlock:(void(^)(id response))suc withErrorBlock:(void(^)(id response))error;


/// 注册前验证身份是否可以注册
/// @param cardNumStr 身份证号
/// @param suc suc description
/// @param error error description
+(void)verifyCardNumRegister:(NSString *)cardNumStr withBlock:(void(^)(id response))suc withErrorBlock:(void(^)(id response))error;


/// 执行注册
/// @param paraDict 参数字典
/// @param suc suc description
/// @param error error description
//+(void)registerRequest:(NSDictionary *)paraDict withBlock:(void(^)(id response))suc withErrorBlock:(void(^)(id response))error;

+(void)registerRequest:(NSDictionary *)paraDict authCode:(NSString*)codeStr withBlock:(void(^)(id response))suc withErrorBlock:(void(^)(id response))error;

/// 登录请求
/// @param paraDict paraDict description
/// @param suc suc description
/// @param error error description
+(void)loginRequest:(NSDictionary *)paraDict withBlock:(void(^)(id response))suc withErrorBlock:(void(^)(id response))error;

@end

NS_ASSUME_NONNULL_END
