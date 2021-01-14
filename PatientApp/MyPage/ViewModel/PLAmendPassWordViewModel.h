//
//  PLAmendPassWordViewModel.h
//  PatientApp
//
//  Created by mac on 2020/10/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PLAmendPassWordViewModel : NSObject

@property (copy,nonatomic) NSString *telephoneStr;

@property (copy,nonatomic) NSString *codeStr;

@property (copy,nonatomic) NSString *passStr;

@property (copy,nonatomic) NSString *surePassStr;

/// 验证码网络发送成功显示倒计时的回调
@property (copy,nonatomic) void (^codeSendSuccessBlock)(void);

/// 发送验证码
- (void)clickSendCodeButton;
///修改密码请求
- (void)amendPassWordRequest;

@end

NS_ASSUME_NONNULL_END
