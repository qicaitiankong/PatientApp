//
//  PLUserInfoConstantKey.h
//  PatientApp
//
//  Created by mac on 2020/10/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PLUserInfoConstantKey : NSObject

///用户登录成功后userName key
extern NSString *const PL_USER_NAME_SAVE_KEY;
///用户登录成功后userID key
extern NSString *const PL_USER_ID_SAVE_KEY;
///用户登录成功后机构 key
extern NSString *const PL_ORGANIZATION_ID_SAVE_KEY;

@end

NS_ASSUME_NONNULL_END
