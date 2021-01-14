//
//  PLMyPageSingleSelectionView.h
//  PatientApp
//
//  Created by mac on 2020/10/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PLMyPageSingleSelectionView : UIView

@property (strong,nonatomic) UIImageView *leftImageView;

@property (strong,nonatomic) PLCustomLabel *centerLabel;

@property (strong,nonatomic) UIButton *backButton;

@property (strong,nonatomic) UIView *bottomLineView;

@property (copy,nonatomic) void (^clickButtonBlock)(UIButton* _b);

@end

NS_ASSUME_NONNULL_END
