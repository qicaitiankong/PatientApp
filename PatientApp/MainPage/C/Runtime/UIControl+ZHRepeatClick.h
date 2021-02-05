//
//  UIControl+ZHRepeatClick.h
//  PatientApp
//
//  Created by Lizihao Li on 2021/2/5.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>


NS_ASSUME_NONNULL_BEGIN

@interface UIControl (ZHRepeatClick)

/// 点击时间间隔
@property (nonatomic,assign) NSTimeInterval zh_acceptEventInterval;

/// 是否忽略点击 不响应点击事件
@property (nonatomic,assign) BOOL zh_ignoreEvent;

@end

NS_ASSUME_NONNULL_END
