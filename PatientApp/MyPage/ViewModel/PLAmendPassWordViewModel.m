//
//  PLAmendPassWordViewModel.m
//  PatientApp
//
//  Created by mac on 2020/10/20.
//

#import "PLAmendPassWordViewModel.h"
#import "PLLoginAndRegisterNetWork.h"
#import "PLMyPageNetWork.h"
#import "PLLoginViewModel.h"

@implementation PLAmendPassWordViewModel

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

- (void)amendPassWordRequest
{

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
    NSString *md5Str = [self.passStr md5HashToLower32Bit];
    [paraDict setValue:md5Str forKey:@"password"];
    NSString *userIdStr = [PLLoginViewModel getLoginUserIdStr];
    [paraDict setValue:userIdStr forKey:@"userId"];
    [PLMyPageNetWork amendPassWordRequest: paraDict withBlock:^(id  _Nonnull response) {
        NSDictionary *resultDict = [NSDictionary getResultDictionaryBySeverDictionary:response];
        NSString *msgCodeStr = [resultDict acquireStringValueByKey:@"msgCode"];
        NSString *msg = [resultDict acquireStringValueByKey:@"msg"];
        if (msgCodeStr.integerValue == PL_SERVICE_TRUE_NUM)
        {
            [HSHud showSuccessWithText:@"密码修改成功"];
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
