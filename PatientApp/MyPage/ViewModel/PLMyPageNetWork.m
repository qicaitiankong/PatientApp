//
//  PLMyPageNetWork.m
//  PatientApp
//
//  Created by mac on 2020/10/19.
//

#import "PLMyPageNetWork.h"
#import "PLNetWorkManager.h"

@implementation PLMyPageNetWork


+(void)existLoginRequest:(NSDictionary *)paraDict withBlock:(void(^)(id response))suc withErrorBlock:(void(^)(id response))error{
    NSString *urlStr = [NSString stringWithFormat:@"%@/out",PL_URL_STR];
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


+(void)getPersonalInfo:(NSDictionary *)paraDict withBlock:(void(^)(id response))suc withErrorBlock:(void(^)(id response))error{
    NSString *urlStr = [NSString stringWithFormat:@"%@/patientserver-service/appPatient/getPatientInfo",PL_URL_STR];
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

+(void)findPassWordRequest:(NSDictionary *)paraDict withBlock:(void(^)(id response))suc withErrorBlock:(void(^)(id response))error{
    NSString *urlStr = [NSString stringWithFormat:@"%@/patientserver-service/user/findPassword",PL_URL_STR];
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

+(void)amendPassWordRequest:(NSDictionary *)paraDict withBlock:(void(^)(id response))suc withErrorBlock:(void(^)(id response))error{
    NSString *urlStr = [NSString stringWithFormat:@"%@/patientserver-service/user/updatePassword",PL_URL_STR];
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


+(void)testRequest:(NSDictionary *)paraDict withBlock:(void(^)(id response))suc withErrorBlock:(void(^)(id response))error{
    NSString *urlStr = @"http://47.104.255.147:8089/SMBMS/marry/myCollects";
    //[HSHud showLoading];
    [PLNetWorkManager postRequestWithUrlString:urlStr parameters:paraDict resultBlock:^(id responseObject)
    {
        //[HSHud dismissHud];
        if (responseObject)
        {
            suc(responseObject);
        }
    } errorBlock:^(id responseObject)
    {
       // [HSHud dismissHud];
        if (responseObject)
        {
            error(responseObject);
        }
    }];
}


@end
