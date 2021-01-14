//
//  PLLoginViewModel.h
//  PatientApp
//
//  Created by mac on 2020/10/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum myClickType {
    ClickLogin    = 1,  ///< 点击登录
    ClickRegister     = 2,  ///< 点击注册
    ClickForgetPassWorld  = 3   ///< 点击忘记密码
}MyClickType;

@interface PLLoginViewModel : NSObject


//登录界面
@property (assign,nonatomic) MyClickType clickType;

/// 登录界面省份证
@property (copy,nonatomic) NSString *loginIdentityStr;

/// 登录界面密码
@property (copy,nonatomic) NSString *loginPassStr;

- (void)dealOperationByClickState;

/// 登陆
- (void)loginRequest;

//登录界面 end



//注册界面
@property (copy,nonatomic) NSString *nameStr;

/// 注册界面身份证
@property (copy,nonatomic) NSString *identityStr;

@property (copy,nonatomic) NSString *telephoneStr;

@property (copy,nonatomic) NSString *codeStr;

@property (copy,nonatomic) NSString *passStr;

@property (copy,nonatomic) NSString *surePassStr;

/// 验证码网络发送成功显示倒计时的回调
@property (copy,nonatomic) void (^codeSendSuccessBlock)(void);

/// 发送验证码
- (void)clickSendCodeButton;
///注册请求
- (void)registerRequest;

//注册界面 end


/// 保存登录后的关键信息
/// @param userName 用户名
/// @param userId 用户唯一id
/// @param orgId 机构id
+ (BOOL)saveUserInfo:(NSString*)userName withUserId:(NSString*)userId withOrganazitionId:(NSString*)orgId;

/// 移除用户登录信息
+ (BOOL)removeUserInfoLoginSaveKey;

/// 获取用户id
+ (NSString*)getLoginUserIdStr;

/// 获取用户名
+ (NSString*)getLoginUserNameStr;

/// 获取机构id
+ (NSString*)getLoginOrganizationIdStr;


/// 用户是否登录
+ (BOOL)judgeUserLogin;


@end

NS_ASSUME_NONNULL_END
