//
//  PLCanClickLabelWithBottomHorinzontalLine.h
//  PatientApp
//
//  Created by mac on 2020/10/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PLCanClickLabelWithBottomHorinzontalLine : UIView

@property (strong,nonatomic) UILabel *titleLabel;

@property (copy,nonatomic) void (^clickButtonBlock)(void);


/// 获取带下划线的可点击标题（单行）
/// @param frame 可传入CGRectZero，并没有用到
/// @param height 控件高度
/// @param titleStr 标题
/// @param font 字体
/// @param textColor 字体颜色
/// @param lineColor 下划线颜色
- (instancetype)initWithFrame:(CGRect)frame labelHeight:(CGFloat)height localTitleStr:(NSString*)titleStr localFont:(UIFont*)font localTextColor:(UIColor*)textColor localLineColor:(UIColor*)lineColor;


@end

NS_ASSUME_NONNULL_END
