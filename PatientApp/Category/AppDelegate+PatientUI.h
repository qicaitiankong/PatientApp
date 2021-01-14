//
//  AppDelegate+PatientUI.h
//  PatientApp
//
//  Created by mac on 2020/10/12.
//

#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppDelegate (PatientUI)

-(void)loadRootVC;


/// 获取当前导航栏
+ (UINavigationController*)getCurrentNav;

/// 在app里面点击某处弹出登录界面（不是app首次安装）
+ (void)popLoginVCInApp;

@end

NS_ASSUME_NONNULL_END
