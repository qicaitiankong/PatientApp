//
//  PLCommonNetworkUrlConstant.h
//  PatientApp
//
//  Created by mac on 2020/10/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
//app  请求url
extern NSString *const PL_URL_STR;
//获取聊天消息的url
extern NSString *const PL_GET_MESSAGE_URL_STR;
//获取聊天消息的端口
extern NSString *const PL_GET_MESSAGE_PORT;
//后台返回接口成功标志数字
extern const NSInteger PL_SERVICE_TRUE_NUM;


@interface PLCommonNetworkUrlConstant : NSObject

@end

NS_ASSUME_NONNULL_END
