//
//  PLMyPageTopPartView.h
//  PatientApp
//
//  Created by mac on 2020/10/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PLMyPageTopPartView : UIView

@property (strong,nonatomic) PLCustomLabel *nameLabel;

@property (strong,nonatomic) PLCustomLabel *telephoneLabel;

@property (strong,nonatomic) UIImageView *userHeaderImageView;

@property (strong,nonatomic) PLCustomLabel *identityNumberLabel;

@property (copy,nonatomic) void (^clickButtonBlock)(void);

@end

NS_ASSUME_NONNULL_END
