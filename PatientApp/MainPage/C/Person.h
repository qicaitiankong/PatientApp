//
//  Person.h
//  PatientApp
//
//  Created by Lizihao Li on 2021/2/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject<NSCopying,NSMutableCopying,NSCoding>

@property (nonatomic,copy) NSString *name;

@end

NS_ASSUME_NONNULL_END
