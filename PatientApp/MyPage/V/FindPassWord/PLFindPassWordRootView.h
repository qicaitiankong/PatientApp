//
//  PLFindPassWordRootView.h
//  PatientApp
//
//  Created by mac on 2020/10/20.
//

#import <UIKit/UIKit.h>
#import "PLFindPassWordViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PLFindPassWordRootView : UIView

- (instancetype)initWithFrame:(CGRect)frame withViewModel:(PLFindPassWordViewModel*)viewModel;

@end

NS_ASSUME_NONNULL_END
