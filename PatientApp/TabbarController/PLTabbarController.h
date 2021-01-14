//
//  PLTabbarController.h
//  PatientApp
//
//  Created by mac on 2020/10/12.
//

#import <UIKit/UIKit.h>
#import "UITabBar+JSCCustomTabbar.h"

NS_ASSUME_NONNULL_BEGIN

@interface PLTabbarController : UITabBarController

@property (strong,nonatomic) NSMutableArray *navArr;

@property (strong,nonatomic) UINavigationController *currentSelectedNav;

@end

NS_ASSUME_NONNULL_END
