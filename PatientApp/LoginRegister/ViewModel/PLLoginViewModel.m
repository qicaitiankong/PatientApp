//
//  PLLoginViewModel.m
//  PatientApp
//
//  Created by mac on 2020/10/13.
//

#import "PLLoginViewModel.h"
#import "PLLoginAndRegisterNetWork.h"
#import "PLRegisterViewController.h"
#import "PLUserInfoConstantKey.h"
#import "PLNotificationNameKey.h"
#import "PLFindPasswordViewController.h"

@implementation PLLoginViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}


#pragma mark 登录界面逻辑
- (void)dealOperationByClickState
{
    switch (self.clickType) {
        case ClickLogin:
        {
            [self loginRequest];
        }
            break;
        case ClickRegister:
        {
            PLRegisterViewController *registerVC = [[PLRegisterViewController alloc]init];
            UINavigationController *currentNav = [AppDelegate getCurrentNav];
            [currentNav pushViewController:registerVC animated:YES];
        }
            break;
        case ClickForgetPassWorld:
        {
            PLFindPasswordViewController *findPassWordVC = [[PLFindPasswordViewController alloc]init];
            UINavigationController *currentNav = [AppDelegate getCurrentNav];
            [currentNav pushViewController:findPassWordVC animated:YES];
        }
            break;
        default:
            break;
    }
}

- (void)loginRequest
{
    if (self.loginIdentityStr.length == 0)
    {
        [HSHud showErrorWithText:@"请输入身份证号"];
        return;
    }else if (NO == [NSString validateIdentityCard:self.loginIdentityStr])
    {
        [HSHud showErrorWithText:@"身份证格式不正确"];
        return;
    }
    if (self.loginPassStr.length == 0)
    {
        [HSHud showErrorWithText:@"请输入密码"];
        return;
    }
    NSString *md5PasswordStr = [self.loginPassStr md5HashToLower32Bit];
    [PLLoginAndRegisterNetWork loginRequest:@{@"username":self.loginIdentityStr,@"password":md5PasswordStr} withBlock:^(id  _Nonnull response) {
        NSDictionary *resultDict = [NSDictionary getResultDictionaryBySeverDictionary:response];
        NSString *msgCodeStr = [resultDict acquireStringValueByKey:@"msgCode"];
        NSString *msg = [resultDict acquireStringValueByKey:@"msg"];
        if (msgCodeStr.integerValue == PL_SERVICE_TRUE_NUM)
        {
            NSDictionary *dataDict = [NSDictionary getResultDictionaryBySeverDictionary:response[@"data"]];
            NSString *userIdStr = [dataDict acquireStringValueByKey:@"userId"];
            NSString *userNameStr = [dataDict acquireStringValueByKey:@"userName"];
            NSString *orgIdStr = [dataDict acquireStringValueByKey:@"orgId"];
            BOOL saveSuccess = [PLLoginViewModel saveUserInfo:userNameStr withUserId:userIdStr withOrganazitionId:orgIdStr];
            if(saveSuccess)
            {
                [[NSNotificationCenter defaultCenter] postNotificationName:PL_USER_LOGIN_SUCCESS_KEY object:nil userInfo:nil];
                //登录成功
                UINavigationController *currentNav = [AppDelegate getCurrentNav];
                [currentNav popViewControllerAnimated:YES];
            }else
            {
                NSLog(@"登录信息保存失败");
            }
       
        }else
        {
            [HSHud showToast:msg];
        }
    } withErrorBlock:^(id  _Nonnull response) {
        
    }];
}


#pragma end

#pragma mark 注册界面逻辑

- (void)clickSendCodeButton
{
    if ([self.telephoneStr isMobilePhoneNumber])
    {
        
        [PLLoginAndRegisterNetWork getMobileCode:self.telephoneStr withBlock:^(id  _Nonnull response)
        {
            NSDictionary *resultDict = [NSDictionary getResultDictionaryBySeverDictionary:response];
            NSString *msgCodeStr = [resultDict acquireStringValueByKey:@"msgCode"];
            NSString *msg = [resultDict acquireStringValueByKey:@"msg"];
            if (msgCodeStr.integerValue == PL_SERVICE_TRUE_NUM)
            {
                [HSHud showSuccessWithText:@"验证码已发送"];
                if (self.codeSendSuccessBlock)
                {
                    self.codeSendSuccessBlock();
                }
            }else
            {
                [HSHud showToast:msg];
            }
        } withErrorBlock:^(id  _Nonnull response) {
            [HSHud showErrorWithText:@"请求失败"];
        }];
    }else
    {
        [HSHud showToast:@"请输入正确格式手机号"];
    }
}

- (void)registerRequest
{
    if (self.nameStr.length == 0)
    {
        [HSHud showErrorWithText:@"请输入姓名"];
        return;
    }
    if (self.identityStr.length == 0)
    {
        [HSHud showErrorWithText:@"请输入身份证号"];
        return;
    }else if (NO == [NSString validateIdentityCard:self.identityStr])
    {
        [HSHud showErrorWithText:@"身份证格式不正确"];
        return;
    }
    if (self.telephoneStr.length == 0)
    {
        [HSHud showErrorWithText:@"请输入手机号"];
        return;
    }
    if (self.codeStr.length == 0)
    {
        [HSHud showErrorWithText:@"请输入验证码"];
        return;
    }
    if (self.passStr.length == 0)
    {
        [HSHud showErrorWithText:@"请输入新密码"];
        return;
    }else if([self.passStr isAccordLoginPassWordRegular] == NO)
    {
        [HSHud showErrorWithText:@"新密码格式不正确"];
        return;
    }
    
    if (self.surePassStr.length == 0)
    {
        [HSHud showErrorWithText:@"请输入确认密码"];
        return;
    }else if(NO == [self.surePassStr isEqualToString:self.passStr])
    {
        [HSHud showErrorWithText:@"确认密码与新密码不相同"];
        return;
    }
    WS(weakSelf);
    [self checkCardNumCanRegister:^(BOOL verify) {
        if (verify)
        {
            [weakSelf excuteRegisterRequest];
        }
    }];
}

/// 检验身份证是否可以注册
/// @param complete verify
- (void)checkCardNumCanRegister:(void(^)(BOOL verify))complete
{
    
    
    [PLLoginAndRegisterNetWork verifyCardNumRegister:self.identityStr withBlock:^(id  _Nonnull response) {
        NSDictionary *resultDict = [NSDictionary getResultDictionaryBySeverDictionary:response];
        NSString *msgCodeStr = [resultDict acquireStringValueByKey:@"msgCode"];
        NSString *msg = [resultDict acquireStringValueByKey:@"msg"];
        if (msgCodeStr.integerValue == PL_SERVICE_TRUE_NUM)
        {
            complete(YES);
        }else
        {
            complete(NO);
            [HSHud showToast:msg];
        }
        
    } withErrorBlock:^(id  _Nonnull response) {
        
    }];
}
///注册请求
- (void)excuteRegisterRequest
{
    NSMutableDictionary *paraDict = [[NSMutableDictionary alloc]init];
    [paraDict setValue:self.nameStr forKey:@"truename"];
    [paraDict setValue:self.identityStr forKey:@"cardNum"];
    [paraDict setValue:self.telephoneStr forKey:@"tel"];
    //[paraDict setValue:self.codeStr forKey:@"authCode"];
    NSString *md5Str = [self.passStr md5HashToLower32Bit];
    [paraDict setValue:md5Str forKey:@"password"];
    [paraDict setValue:@"edbee4d1cb1c46ea9cf529c4105fe258" forKey:@"roleId"];
    
    
    [PLLoginAndRegisterNetWork registerRequest:paraDict authCode:self.codeStr withBlock:^(id  _Nonnull response) {
        NSDictionary *resultDict = [NSDictionary getResultDictionaryBySeverDictionary:response];
        NSString *msgCodeStr = [resultDict acquireStringValueByKey:@"msgCode"];
        NSString *msg = [resultDict acquireStringValueByKey:@"msg"];
        if (msgCodeStr.integerValue == PL_SERVICE_TRUE_NUM)
        {
            UINavigationController *currentNav = [AppDelegate getCurrentNav];
            [currentNav popViewControllerAnimated:YES];
        }else
        {
            [HSHud showErrorWithText:msg];
        }
    } withErrorBlock:^(id  _Nonnull response) {
        
    }];
}

#pragma end

#pragma mark 用户登录关键信息设置
+ (BOOL)saveUserInfo:(NSString*)userName withUserId:(NSString*)userId withOrganazitionId:(NSString*)orgId
{
   
    [[NSUserDefaults standardUserDefaults] setValue:userId forKey:PL_USER_ID_SAVE_KEY];
    [[NSUserDefaults standardUserDefaults] setValue:userName forKey:PL_USER_NAME_SAVE_KEY];
    [[NSUserDefaults standardUserDefaults] setValue:orgId forKey:PL_ORGANIZATION_ID_SAVE_KEY];
    BOOL saveSuccess = [[NSUserDefaults standardUserDefaults] synchronize];
    return saveSuccess;
}

+ (BOOL)removeUserInfoLoginSaveKey
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:PL_USER_NAME_SAVE_KEY];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:PL_USER_ID_SAVE_KEY];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:PL_ORGANIZATION_ID_SAVE_KEY];
    BOOL removeTokenFlag = [[NSUserDefaults standardUserDefaults] synchronize];
    return removeTokenFlag;
}

+ (NSString*)getLoginUserIdStr
{
    NSString *userIdStr = [[NSUserDefaults standardUserDefaults] valueForKey:PL_USER_ID_SAVE_KEY];
    return userIdStr;
}

+ (NSString*)getLoginUserNameStr
{
    NSString *userNameStr = [[NSUserDefaults standardUserDefaults] valueForKey:PL_USER_NAME_SAVE_KEY];
    return userNameStr;
}

+ (NSString*)getLoginOrganizationIdStr
{
    NSString *organizationIdStr = [[NSUserDefaults standardUserDefaults] valueForKey:PL_ORGANIZATION_ID_SAVE_KEY];
    return organizationIdStr;
}

+ (BOOL)judgeUserLogin
{
    NSString *userIdStr = [[NSUserDefaults standardUserDefaults] valueForKey:PL_USER_ID_SAVE_KEY];
    return (userIdStr.length ? YES : NO);
}


#pragma end

@end
