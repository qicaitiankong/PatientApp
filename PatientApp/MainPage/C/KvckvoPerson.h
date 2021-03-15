//
//  KvckvoPerson.h
//  PatientApp
//
//  Created by Lizihao Li on 2021/2/14.
//

#import <Foundation/Foundation.h>
#import "KvcKvoDog.h"

NS_ASSUME_NONNULL_BEGIN

@interface KvckvoPerson : NSObject

@property (nonatomic,copy) NSString *name;

@property (nonatomic,assign) NSInteger age;

@property (nonatomic,strong) KvcKvoDog *dog;

@end

NS_ASSUME_NONNULL_END
