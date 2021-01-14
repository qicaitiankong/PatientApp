//
//  MyPageMainViewModel.h
//  PatientApp
//
//  Created by mac on 2020/10/14.
//

#import <Foundation/Foundation.h>
#import "MyPageMainModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef enum myPageClickType {
    ClickUserPhoto     = 1,
    
    ClickPersonalInfo     = 2,
    ClickCustomerService     = 3,
    ClickAmendPassWord     = 4,
    ClickUpdateApp     = 5,
    
    ClickExistLogin    = 6,
}MyPageClickType;

@interface MyPageMainViewModel : NSObject

@property (strong,nonatomic) MyPageMainModel *model;

@property (assign,nonatomic) MyPageClickType clickButtonType;

/// 登录成功回调
@property (copy,nonatomic) void (^loginSucessBlock)(void);

/// 退出登录回调
@property (copy,nonatomic) void (^loginOutSucessBlock)(void);


/// 当用户点击后处理操作
- (void)dealOperationWhenClickByType;

/// 获取用户信息
- (void)getPersonalInfo;


@end

NS_ASSUME_NONNULL_END
