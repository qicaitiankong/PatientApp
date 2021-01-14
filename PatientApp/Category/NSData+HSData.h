//
//  NSData+HSData.h
//  JSEDU
//
//  Created by 金石 on 2018/8/28.
//  Copyright © 2018年 孔祥刚. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (HSData)

- (NSString *)base64EncodedString;

+ (NSData *)dataWithBase64EncodedString:(NSString *)base64EncodedString;
@end
