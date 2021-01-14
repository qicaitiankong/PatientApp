//
//  HSHud.h
//  JSEDU
//
//  Created by 金石 on 2018/7/27.
//  Copyright © 2018年 孔祥刚. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SVProgressHUD.h>
/**
 hud
 */

@interface HSHud : NSObject

/**
 展示一个toast

 @param text 文本
 */
+ (void)showToast:(NSString *)text;

/**
 展示一个等待hud

 @param text 文本
 */
+ (void)showHudWithText:(NSString *)text;




/**
 请求成功

 @param text 文本
 */
+ (void)showSuccessWithText:(NSString *)text;


/**
 请求错误

 @param text 文本
 */
+ (void)showErrorWithText:(NSString *)text;
+(void)showLoading;
/**
 隐藏hud
 */
+ (void)dismissHud;
@end
