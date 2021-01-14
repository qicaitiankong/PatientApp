//
//  PLMyPageRootView.h
//  PatientApp
//
//  Created by mac on 2020/10/13.
//

#import <UIKit/UIKit.h>
#import "MyPageMainViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PLMyPageRootView : UIView

-(instancetype)initWithFrame:(CGRect)frame withViewModel:(MyPageMainViewModel*)localViewModel;

@end

NS_ASSUME_NONNULL_END
