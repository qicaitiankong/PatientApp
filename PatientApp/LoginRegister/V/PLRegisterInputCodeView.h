//
//  PLRegisterInputCodeView.h
//  PatientApp
//
//  Created by mac on 2020/10/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PLRegisterInputCodeView : UIView

@property (strong,nonatomic) PLBaseTextField *textFieldView;

@property (strong,nonatomic) UIView *textFieldBottomLine;

@property (copy,nonatomic) void (^clickSendCodeButtonBlock)(void);

/// 验证码发送成功后更新显示
- (void)changeDisplayWhenCodeSendSuccess;

@end

NS_ASSUME_NONNULL_END
