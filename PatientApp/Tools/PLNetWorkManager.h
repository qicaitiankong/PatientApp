//
//  NetWorkManager.h
//  BasicFramework
//
//  Created by Rainy on 16/10/26.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import <AFNetworking.h>

@interface PLNetWorkManager : AFHTTPSessionManager


/// 设置返回数据可接受类型和延迟时间
/// @param manager manager description
/// @param kTimeoutInterval 延迟时间
+(void)setManager:(AFHTTPSessionManager *)manager withTimeoutInterval:(NSInteger )kTimeoutInterval;


/// 单次 get请求
/// @param urlStr urlStr description
/// @param parameters parameters description
/// @param successMethod 成功回调
/// @param errorMethod 失败回调
+(void)getRequestWithUrlString:(NSString *)urlStr parameters:(id)parameters resultBlock:(void (^)(id responseObject))successMethod errorBlock:(void (^)(id responseObject))errorMethod;


/// 单次 post 请求
/// @param urlStr urlStr description
/// @param parameters parameters description
/// @param successMethod 成功回调
/// @param errorMethod 失败回调
+(void)postRequestWithUrlString:(NSString *)urlStr parameters:(id)parameters resultBlock:(void (^)(id responseObject))successMethod errorBlock:(void (^)(id responseObject))errorMethod;


/// post json 请求
/// @param urlStr urlStr description
/// @param parameters parameters description
/// @param successMethod 成功回调
/// @param errorMethod 失败回调
+(void)postJsonDataRequestWithUrlString:(NSString *)urlStr parameters:(id)parameters resultBlock:(void (^)(id responseObject))successMethod errorBlock:(void (^)(id responseObject))errorMethod;


/// 上传图片
/// @param urlStr urlStr description
/// @param parameters parameters description
/// @param imageDataArr 图片data数组 建议通过异步压缩处理完图片后再传入
/// @param successMethod 成功回调
/// @param errorMethod 失败回调
+(void)postImagesRequestWithUrlString:(NSString *)urlStr parameters:(id)parameters imagesDataArr:(NSArray *)imageDataArr resultBlock:(void (^)(id responseObject))successMethod errorBlock:(void (^)(id responseObject))errorMethod;


@end
