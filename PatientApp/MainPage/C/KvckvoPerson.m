//
//  KvckvoPerson.m
//  PatientApp
//
//  Created by Lizihao Li on 2021/2/14.
//

#import "KvckvoPerson.h"

@interface KvckvoPerson (){
    NSString *name2;

}
@end


@implementation KvckvoPerson

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dog = [[KvcKvoDog alloc]init];
    }
    return self;
}

@end
