//
//  PLRegisterRootView.h
//  PatientApp
//
//  Created by mac on 2020/10/15.
//

#import <UIKit/UIKit.h>
#import "PLLoginViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PLRegisterRootView : UIView

- (instancetype)initWithFrame:(CGRect)frame withViewModel:(PLLoginViewModel*)viewModel;

@end

NS_ASSUME_NONNULL_END
