//
//  NSObject+RuntimeModel.h
//  PatientApp
//
//  Created by Lizihao Li on 2021/2/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (RuntimeModel)

+(instancetype)initWithDictionaryForModel:(NSDictionary*)dict;


@end

NS_ASSUME_NONNULL_END
