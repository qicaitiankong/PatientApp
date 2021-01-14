//
//  PLMyPageCenterGroupView.h
//  PatientApp
//
//  Created by mac on 2020/10/13.
//

#import <UIKit/UIKit.h>
#import "PLRoundedBoardView.h"

NS_ASSUME_NONNULL_BEGIN

@interface PLMyPageCenterGroupView : PLRoundedBoardView

@property (copy,nonatomic) void (^clickButtonStyle)(NSInteger buttonTag);

@end

NS_ASSUME_NONNULL_END
