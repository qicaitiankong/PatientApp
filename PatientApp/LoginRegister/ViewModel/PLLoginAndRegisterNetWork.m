//
//  PLLoginAndRegisterNetWork.m
//  PatientApp
//
//  Created by mac on 2020/10/16.
//

#import "PLLoginAndRegisterNetWork.h"

@implementation PLLoginAndRegisterNetWork
+(void)getMobileCode:(NSString *)telephoneStr withBlock:(void(^)(id response))suc withErrorBlock:(void(^)(id response))error{
    NSString *urlStr = [NSString stringWithFormat:@"%@/patientserver-service/user/getAuthCode",PL_URL_STR];
    [HSHud showLoading];
    [PLNetWorkManager getRequestWithUrlString:urlStr parameters:@{@"telephone": telephoneStr} resultBlock:^(id responseObject) {
        [HSHud dismissHud];
        if (responseObject)
        {
            suc(responseObject);
        }
    } errorBlock:^(id responseObject) {
        [HSHud dismissHud];
        if (responseObject)
        {
            error(responseObject);
        }
    }];
    
}

+(void)verifyCardNumRegister:(NSString *)cardNumStr withBlock:(void(^)(id response))suc withErrorBlock:(void(^)(id response))error{
    NSString *urlStr = [NSString stringWithFormat:@"%@/patientserver-service/user/getIsInquiry",PL_URL_STR];
    [HSHud showLoading];
    [PLNetWorkManager postRequestWithUrlString:urlStr parameters:@{@"cardNum": cardNumStr} resultBlock:^(id responseObject) {
        [HSHud dismissHud];
        if (responseObject)
        {
            suc(responseObject);
        }
    } errorBlock:^(id responseObject) {
        [HSHud dismissHud];
        if (responseObject)
        {
            error(responseObject);
        }
    }];
    
}

+(void)registerRequest:(NSDictionary *)paraDict authCode:(NSString*)codeStr withBlock:(void(^)(id response))suc withErrorBlock:(void(^)(id response))error{
    NSString *urlStr = [NSString stringWithFormat:@"%@/patientserver-service/user/register?authCode=%@",PL_URL_STR,codeStr];
    [HSHud showLoading];
    [PLNetWorkManager postJsonDataRequestWithUrlString:urlStr parameters:paraDict resultBlock:^(id responseObject) {
        [HSHud dismissHud];
        if (responseObject)
        {
            suc(responseObject);
        }
        
    } errorBlock:^(id responseObject) {
        [HSHud dismissHud];
        if (responseObject)
        {
            error(responseObject);
        }
    }];
    
}

+(void)loginRequest:(NSDictionary *)paraDict withBlock:(void(^)(id response))suc withErrorBlock:(void(^)(id response))error{
    NSString *urlStr = [NSString stringWithFormat:@"%@/login",PL_URL_STR];
    [HSHud showLoading];
    [PLNetWorkManager postRequestWithUrlString:urlStr parameters:paraDict resultBlock:^(id responseObject)
    {
        [HSHud dismissHud];
        if (responseObject)
        {
            suc(responseObject);
        }
    } errorBlock:^(id responseObject)
    {
        [HSHud dismissHud];
        if (responseObject)
        {
            error(responseObject);
        }
    }];
}

@end
