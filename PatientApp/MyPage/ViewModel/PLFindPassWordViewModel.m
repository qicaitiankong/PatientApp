//
//  PLFindPassWordViewModel.m
//  PatientApp
//
//  Created by mac on 2020/10/20.
//

#import "PLFindPassWordViewModel.h"
#import "PLLoginAndRegisterNetWork.h"
#import "PLMyPageNetWork.h"

@interface PLFindPassWordViewModel ()

@end

@implementation PLFindPassWordViewModel

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        
    }
    return self;
}

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

- (void)findPassWordRequest
{
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
     NSMutableDictionary *paraDict = [[NSMutableDictionary alloc]init];
    [paraDict setValue:self.telephoneStr forKey:@"telephone"];
    [paraDict setValue:self.codeStr forKey:@"authCode"];
    NSString *md5Str = [self.passStr md5HashToLower32Bit];
    [paraDict setValue:md5Str forKey:@"password"];
    [paraDict setValue:self.identityStr forKey:@"userName"];
    [PLMyPageNetWork findPassWordRequest: paraDict withBlock:^(id  _Nonnull response) {
        NSDictionary *resultDict = [NSDictionary getResultDictionaryBySeverDictionary:response];
        NSString *msgCodeStr = [resultDict acquireStringValueByKey:@"msgCode"];
        NSString *msg = [resultDict acquireStringValueByKey:@"msg"];
        if (msgCodeStr.integerValue == PL_SERVICE_TRUE_NUM)
        {
            [HSHud showSuccessWithText:@"密码设置成功"];
            UINavigationController *currentNav = [AppDelegate getCurrentNav];
            [currentNav popViewControllerAnimated:YES];
        }else
        {
            [HSHud showErrorWithText:msg];
        }
    } withErrorBlock:^(id  _Nonnull response) {
        
    }];
    
}


@end
