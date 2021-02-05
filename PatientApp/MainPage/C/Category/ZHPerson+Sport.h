//
//  ZHPerson+Sport.h
//  PatientApp
//
//  Created by Lizihao Li on 2021/2/5.
//

#import "ZHPerson.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZHPerson (Sport)<NSCopying>

@property (nonatomic,assign) NSInteger stepCount;

@property (nonatomic,copy) NSString *startTime;


- (void)sport;

+ (void)sport;

- (void)run;

+ (void)run;



@end

NS_ASSUME_NONNULL_END
