//
//  CustomJSObject.m
//  PatientApp
//
//  Created by Lizihao Li on 2021/2/8.
//

#import "CustomJSObject.h"




@implementation CustomJSObject

- (id)initWithSuccessCallback:(JSObjectBlock)success faileCallback:(JSObjectBlock)fail;
{
    self = [super init];
    
    if (self) {
        self.successBlock = success;
        self.failBlock = fail;
        self.actionsArray = [NSMutableArray array];
    }
    
    return self;
}

- (void)addToTimerAction:(NSString *)action {
    
    [self.actionsArray addObject:action];
    
    __block NSInteger seconds = 0;
    dispatch_queue_t queue = dispatch_get_main_queue();
    __block dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_time_t start = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC));
    uint64_t interval = (uint64_t)(1 * NSEC_PER_SEC);
    dispatch_source_set_timer(timer, start, interval, 0);
    dispatch_source_set_event_handler(timer, ^{
        seconds++;
        if (seconds == 1) {
            dispatch_cancel(timer);
            [self.actionsArray removeObject:action];
        }
    });
    // 启动定时器
    dispatch_resume(timer);
}

- (BOOL)isRuningInActionsArray:(NSString *)action {
    
    return [self.actionsArray containsObject:action];
}

//实现协议中的方法
-(void)helloWQL
{
    //新线程，不是主线程
    NSLog(@"[NSThread.currentThread]=%@",[NSThread currentThread]);

    dispatch_async(dispatch_get_main_queue(), ^{
       
        if (self.successBlock) {
            self.successBlock(@{@"helloWQL":@""});
        }
        
    });
}

- (void)sendValueFromHtmlToOCWithValue:(NSString*)str1{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.successBlock)
        {
            NSString *info = str1;
            self.successBlock(@{@"singleValueKey":info});
        }
    });
}

- (void)sendValueFromHtmlToOCWithValue:(NSString*)str1 WithValueTwo:(NSString*)str2{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.successBlock)
           {
               NSString *info01 = str1;
               NSString *info02 = str2;
               self.successBlock(@{@"firstValueKey":info01,@"secondValueKey":info02});
           }
    });
}

- (void)sendValueToHtml{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.successBlock)
           {
               self.successBlock(@{@"ocSendValueToH5":@""});
           }
    });
}

@end
