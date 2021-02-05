//
//  ZHPerson.h
//  PatientApp
//
//  Created by Lizihao Li on 2021/2/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZHPerson : NSObject

@property (nonatomic,assign) NSInteger height;

@property (nonatomic,assign) NSInteger weight;

@property (nonatomic,copy) NSString *name;

@property (nonatomic,strong) NSDate *birthday;

- (void)life;

+ (void)life;

@end

NS_ASSUME_NONNULL_END
