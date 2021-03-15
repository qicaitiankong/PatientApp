//
//  ZHProxy.h
//  PatientApp
//
//  Created by Lizihao Li on 2021/3/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZHProxy : NSProxy

@property (nonatomic,weak) id target;

@end

NS_ASSUME_NONNULL_END
