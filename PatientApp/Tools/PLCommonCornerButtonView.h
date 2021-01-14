//
//  PLCommonCornerButtonView.h
//  PatientApp
//
//  Created by mac on 2020/10/14.
//

#import <UIKit/UIKit.h>
#import "PLRoundedBoardView.h"

NS_ASSUME_NONNULL_BEGIN

@interface PLCommonCornerButtonView : UIView

@property (strong,nonatomic) PLCustomLabel *titleLabel;

@property (copy,nonatomic) void (^clickButtonBlock)(void);

@end

NS_ASSUME_NONNULL_END
