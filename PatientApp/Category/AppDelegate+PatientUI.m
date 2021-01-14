//
//  AppDelegate+PatientUI.m
//  PatientApp
//
//  Created by mac on 2020/10/12.
//

#import "AppDelegate+PatientUI.h"
#import "PLTabbarController.h"
#import "PLLoginViewController.h"

@implementation AppDelegate (PatientUI)

-(void)loadRootVC
{
    PLTabbarController *tabBarControl = [[PLTabbarController alloc] init];
    [self.window setRootViewController:tabBarControl];
    [self.window makeKeyAndVisible];
}

+ (UINavigationController*)getCurrentNav{
    AppDelegate *appDele = (AppDelegate*)[UIApplication sharedApplication].delegate;
    UIWindow *window = appDele.window;
    UIViewController *tabBarController = window.rootViewController;
    if([tabBarController isKindOfClass:[PLTabbarController class]]){
        PLTabbarController  *tabbarCon = (PLTabbarController *)window.rootViewController;
        return tabbarCon.currentSelectedNav;
    }
    return nil;
}

+ (void)popLoginVCInApp
{
    UINavigationController *currentNav = [AppDelegate getCurrentNav];
    PLLoginViewController *loginVC = [[PLLoginViewController alloc]init];
    loginVC.hidesBottomBarWhenPushed = YES;
    [currentNav pushViewController:loginVC animated:YES];
}

@end
