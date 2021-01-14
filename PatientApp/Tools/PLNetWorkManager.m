//
//  PLNetWorkManager.h
//  BasicFramework
//
//  Created by Rainy on 16/10/26.
//  Copyright © 2016年 Rainy. All rights reserved.
//



#import "PLNetWorkManager.h"

#define kTimeoutInterval  15

@interface PLNetWorkManager ()

@end

@implementation PLNetWorkManager

+(void)getRequestWithUrlString:(NSString *)urlStr parameters:(id)parameters resultBlock:(void (^)(id responseObject))successMethod errorBlock:(void (^)(id responseObject))errorMethod
{
    
    //创建管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //设置请求参数的拼接å∫
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    //设置接收响应的数据类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [PLNetWorkManager setManager:manager withTimeoutInterval:kTimeoutInterval];
    [manager GET:urlStr parameters:parameters headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject)
        {
            successMethod(responseObject);
        }else
        {
            [HSHud dismissHud];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorMethod(error);
    }];
}

+(void)postRequestWithUrlString:(NSString *)urlStr parameters:(id)parameters resultBlock:(void (^)(id responseObject))successMethod errorBlock:(void (^)(id responseObject))errorMethod
{
        //创建管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [PLNetWorkManager setManager:manager withTimeoutInterval:kTimeoutInterval];
    [manager POST:urlStr parameters:parameters headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject)
        {
            successMethod(responseObject);
        }else
        {
            [HSHud dismissHud];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorMethod(error);
    }];
}
//
+(void)postJsonDataRequestWithUrlString:(NSString *)urlStr parameters:(id)parameters resultBlock:(void (^)(id responseObject))successMethod errorBlock:(void (^)(id responseObject))errorMethod{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];

    [PLNetWorkManager setManager:manager withTimeoutInterval:kTimeoutInterval];
    [manager POST:urlStr parameters:parameters headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject)
        {
            successMethod(responseObject);
        }else
        {
            [HSHud dismissHud];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorMethod(error);
    }];
}

//上传图片
+(void)postImagesRequestWithUrlString:(NSString *)urlStr parameters:(id)parameters imagesDataArr:(NSArray *)imageDataArr resultBlock:(void (^)(id responseObject))successMethod errorBlock:(void (^)(id responseObject))errorMethod{
    //创建管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [PLNetWorkManager setManager:manager withTimeoutInterval:kTimeoutInterval];

    [manager POST:urlStr parameters:parameters headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData)
    {
        if (imageDataArr)
        {
            for (int i = 0; i < imageDataArr.count;i++)
            {
                //NSData *imgData = imageDataArr[i];
                //需要根据实际需求调整拼接
                //[formData appendPartWithFileData:imgData name:[NSString stringWithFormat:@"Img%d",i] fileName:[NSString stringWithFormat:@"%d.png",i] mimeType:@"image/jpg/png"];
            }
        }
    } progress:^(NSProgress * _Nonnull uploadProgress)
    {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
    {
        if (responseObject)
        {
            successMethod(responseObject);
        }else
        {
            [HSHud dismissHud];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
     {
        errorMethod(error);
    }];
    
}


+(void)setManager:(AFHTTPSessionManager *)manager withTimeoutInterval:(NSInteger)timeoutInterval{
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil,nil];
    //启用https请求
    manager.securityPolicy.validatesDomainName = NO;
    manager.securityPolicy.allowInvalidCertificates = YES;

    // 设置超时时间
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = timeoutInterval;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
}

@end
