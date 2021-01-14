//
//  PLMyPageBaseScrollView.h
//  PatientApp
//
//  Created by mac on 2020/10/13.
//

#import <UIKit/UIKit.h>
#import "PLMyPageTopPartView.h"
#import "PLMyPageCenterGroupView.h"
#import "MyPageMainViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PLMyPageBaseScrollView : UIView

@property (strong,nonatomic) PLMyPageTopPartView *topView;

@property (strong,nonatomic) PLMyPageCenterGroupView *centerGroupView;

- (instancetype)initWithFrame:(CGRect)frame withViewModel:(MyPageMainViewModel*)localViewModel;


@end

NS_ASSUME_NONNULL_END
