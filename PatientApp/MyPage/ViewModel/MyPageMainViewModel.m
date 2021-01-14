//
//  MyPageMainViewModel.m
//  PatientApp
//
//  Created by mac on 2020/10/14.
//

#import "MyPageMainViewModel.h"
#import "PLLoginViewController.h"
#import "PLMyPageNetWork.h"
#import "PLLoginViewModel.h"
#import "PLNotificationNameKey.h"
#import "PLAmendPassWordViewController.h"

@implementation MyPageMainViewModel

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        
        self.model.nameStr = @"李大夫";
        self.model.telephoneStr = @"13828844";
        self.model.identityNumberStr = @"012334738478374";
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginSuccessNoti:) name:PL_USER_LOGIN_SUCCESS_KEY object:nil];
        
    }
    return self;
}

- (void)getPersonalInfo
{
    if ([PLLoginViewModel judgeUserLogin])
    {
        NSString *userIdStr = [PLLoginViewModel getLoginUserIdStr];
        
        [PLMyPageNetWork getPersonalInfo:@{@"userId":userIdStr} withBlock:^(id  _Nonnull response) {
            NSDictionary *resultDict = [NSDictionary getResultDictionaryBySeverDictionary:response];
            NSString *msgCodeStr = [resultDict acquireStringValueByKey:@"msgCode"];
            NSString *msg = [resultDict acquireStringValueByKey:@"msg"];
            
            
        } withErrorBlock:^(id  _Nonnull response) {
            
        }];
    }
}


-(MyPageMainModel *)model
{
    if (_model == nil)
    {
        _model = [[MyPageMainModel alloc]init];
    }
    return _model;
}

- (void)dealOperationWhenClickByType
{
    if ([PLLoginViewModel judgeUserLogin])
    {
            switch (self.clickButtonType)
            {
                case ClickUserPhoto:
                {
                    NSLog(@"拍照");
                }
                    break;
                case ClickPersonalInfo:
                {
                    NSLog(@"个人信息");
                }
                    break;
                case ClickCustomerService:
                {
                    NSLog(@"在线客服");
                }
                    break;
                case ClickAmendPassWord:
                {
                    NSLog(@"修改密码");
                    PLAmendPassWordViewController *vc = [[PLAmendPassWordViewController alloc]init];
                    vc.hidesBottomBarWhenPushed = YES;
                    UINavigationController *currentNav = [AppDelegate getCurrentNav];
                    [currentNav pushViewController:vc animated:YES];
                }
                    break;
                case ClickUpdateApp:
                {
                    NSLog(@"版本升级");
                }
                    break;
                case ClickExistLogin:
                {
                    NSLog(@"退出登录");
                    [self loginOutRequest];
                }
                    break;
                default:
                    break;
            }
    }else
    {
        [AppDelegate popLoginVCInApp];
    }
    
}

- (void)loginOutRequest
{
    [PLMyPageNetWork existLoginRequest:@{} withBlock:^(id  _Nonnull response) {
        NSDictionary *resultDict = [NSDictionary getResultDictionaryBySeverDictionary:response];
        NSString *msgCodeStr = [resultDict acquireStringValueByKey:@"msgCode"];
        NSString *msg = [resultDict acquireStringValueByKey:@"msg"];
        if (msgCodeStr.integerValue == PL_SERVICE_TRUE_NUM)
        {
            if ([PLLoginViewModel removeUserInfoLoginSaveKey])
            {
                [[NSNotificationCenter defaultCenter] postNotificationName:PL_USER_LOGIN_OUT_SUCCESS_KEY object:nil userInfo:nil];
                if (self.loginOutSucessBlock)
                {
                    self.loginOutSucessBlock();
                }
                [AppDelegate popLoginVCInApp];
            }
        }else
        {
            [HSHud showToast:msg];
        }
    } withErrorBlock:^(id  _Nonnull response) {
        
    }];
}

//登陆成功
- (void)loginSuccessNoti:(NSNotification*)_n
{
    if (self.loginSucessBlock)
    {
        self.loginSucessBlock();
    }
    [self getPersonalInfo];
}


-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
