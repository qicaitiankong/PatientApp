//
//  NSObject+RuntimeModel.m
//  PatientApp
//
//  Created by Lizihao Li on 2021/2/4.
//

#import "NSObject+RuntimeModel.h"
#import <objc/runtime.h>
#import <objc/message.h>
@implementation NSObject (RuntimeModel)
+(instancetype)initWithDictionaryForModel:(NSDictionary*)dict{
    id myObj = [[self alloc]init];
    unsigned int outCount;//获取类中的所有成员属性
     objc_property_t *arrProperty = class_copyPropertyList([self class], &outCount);
    for (int i = 0; i < outCount; i ++)
    {
        //获取属性名字符串
        objc_property_t property = arrProperty[i];
        //model中的属性名
        NSString *propertyName = [NSString stringWithUTF8String:property_getName(property)];
        id propertyValue = dict[propertyName];
        if (propertyValue)
        {
            [myObj setValue:propertyValue forKey:propertyName];
        }
    }
    //注意在runtime获取属性的时候，并不是ARC Objective-C的对象所有需要释放
    free(arrProperty);
    return myObj;
}

@end
