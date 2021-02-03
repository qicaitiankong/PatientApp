//
//  Person.m
//  PatientApp
//
//  Created by Lizihao Li on 2021/2/2.
//

#import "Person.h"

@implementation Person

-(id)copyWithZone:(NSZone *)zone{
    Person *person = [Person allocWithZone:zone];
    person.name = self.name;
    return person;
}

-(id)mutableCopyWithZone:(NSZone *)zone{
    Person *person = [Person allocWithZone:zone];
    person.name = self.name;
    return person;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self.name = [coder decodeObjectForKey:@"name"];
    return self;
}


- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.name forKey:@"name"];
}

- (void)DoThings:(NSString*)Str Num:(NSInteger)num
{
    NSLog(@"我来完成game中的方法实现");
}



@end

