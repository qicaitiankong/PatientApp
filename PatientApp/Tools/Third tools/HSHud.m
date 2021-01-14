//
//  HSHud.m
//  JSEDU
//
//  Created by 金石 on 2018/7/27.
//  Copyright © 2018年 孔祥刚. All rights reserved.
//

#import "HSHud.h"

static HSHud *_hud;
@interface HSHud ()
@end

#define HUDFont [UIFont getPingFangRegularFont:14]
#define BackgroundColor [UIColor colorWithRed:230 / 255.0 green: 231 / 255.0 blue:232 / 255.0 alpha:0.9]
#define TextColor [UIColor colorWithHexString:@"0x444444"]
@implementation HSHud



+ (void)showToast:(NSString *)text {
    
    [SVProgressHUD setForegroundColor:TextColor];
    [SVProgressHUD setBackgroundColor:BackgroundColor];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
    [SVProgressHUD setMaximumDismissTimeInterval:3];
    [SVProgressHUD displayDurationForString:text];
    [SVProgressHUD setMinimumSize:CGSizeMake(0, 30)];
    [SVProgressHUD setFont:HUDFont];
    [SVProgressHUD showImage:[UIImage imageNamed:@""] status:text];
    AppDelegate *appdele = (AppDelegate*)[UIApplication sharedApplication].delegate;
    appdele.window.userInteractionEnabled = YES;
}

+ (void)showHudWithText:(NSString *)text {
    [SVProgressHUD setForegroundColor:TextColor];
    [SVProgressHUD setBackgroundColor:BackgroundColor];
    [SVProgressHUD setFont:HUDFont];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    [SVProgressHUD setMinimumSize:CGSizeMake(SCREEN_WIDTH / 4, SCREEN_WIDTH / 4)];
    [SVProgressHUD showWithStatus:text];
    AppDelegate *appdele = (AppDelegate*)[UIApplication sharedApplication].delegate;
    appdele.window.userInteractionEnabled = YES;
}


+ (void)showSuccessWithText:(NSString *)text {
    [SVProgressHUD setForegroundColor:TextColor];
    [SVProgressHUD setBackgroundColor:BackgroundColor];
    [SVProgressHUD setFont:HUDFont];
    [SVProgressHUD setInfoImage:[UIImage imageNamed:@"success_image_alert"]];
    //    [SVProgressHUD setErrorImage:[UIImage imageNamed:@"error_image_alert.png"]];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
    [SVProgressHUD setMinimumSize:CGSizeMake(SCREEN_WIDTH / 4, SCREEN_WIDTH / 4)];
    //    [SVProgressHUD showErrorWithStatus:text];
    [SVProgressHUD setMaximumDismissTimeInterval:3];
    [SVProgressHUD displayDurationForString:text];
    [SVProgressHUD showInfoWithStatus:text];
    AppDelegate *appdele = (AppDelegate*)[UIApplication sharedApplication].delegate;
    appdele.window.userInteractionEnabled = YES;
}


+ (void)showErrorWithText:(NSString *)text {
    if ([text isEqualToString:@""] || [text isEqualToString:@"<null>"]) {
        return;
    }
    [SVProgressHUD setForegroundColor:TextColor];
    [SVProgressHUD setBackgroundColor:BackgroundColor];
    [SVProgressHUD setFont:HUDFont];
    [SVProgressHUD setInfoImage:[UIImage imageNamed:@"error_image_alert"]];
//    [SVProgressHUD setErrorImage:[UIImage imageNamed:@"error_image_alert.png"]];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
    [SVProgressHUD setMinimumSize:CGSizeMake(SCREEN_WIDTH / 4, SCREEN_WIDTH / 4)];
//    [SVProgressHUD showErrorWithStatus:text];
    [SVProgressHUD setMaximumDismissTimeInterval:3];
    [SVProgressHUD displayDurationForString:text];
    [SVProgressHUD showInfoWithStatus:text];
    AppDelegate *appdele = (AppDelegate*)[UIApplication sharedApplication].delegate;
    appdele.window.userInteractionEnabled = YES;

}
+(void)showLoading{
    [SVProgressHUD setForegroundColor:TextColor];
    [SVProgressHUD setBackgroundColor:BackgroundColor];
    [SVProgressHUD setFont:HUDFont];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
    [SVProgressHUD setMaximumDismissTimeInterval:3];
    [SVProgressHUD setMinimumSize:CGSizeMake(0, 30)];
    [SVProgressHUD show];
    AppDelegate *appdele = (AppDelegate*)[UIApplication sharedApplication].delegate;
    appdele.window.userInteractionEnabled = NO;
}

+ (void)dismissHud {
    AppDelegate *appdele = (AppDelegate*)[UIApplication sharedApplication].delegate;
    appdele.window.userInteractionEnabled = YES;
    [SVProgressHUD dismiss];
}

@end

