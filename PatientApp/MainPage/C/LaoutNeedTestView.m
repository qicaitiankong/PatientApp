//
//  LaoutNeedTestView.m
//  PatientApp
//
//  Created by Lizihao Li on 2021/2/14.
//

#import "LaoutNeedTestView.h"

@implementation LaoutNeedTestView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        CFRunLoopObserverRef observerRef = CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(), kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
//                       switch (activity) {
//                       case kCFRunLoopEntry:
//                           NSLog(@"runloop启动");
//                           break;
//                       case kCFRunLoopBeforeTimers:
//                           NSLog(@"runloop即将处理timer事件");
//                           break;
//                       case kCFRunLoopBeforeSources:
//                           NSLog(@"runloop即将处理sources事件");
//                           break;
//                       case kCFRunLoopBeforeWaiting:
//                           NSLog(@"runloop即将进入休眠");
//                           break;
//                       case kCFRunLoopAfterWaiting:
//                           NSLog(@"runloop被唤醒");
//                           break;
//                       case kCFRunLoopExit:
//                           NSLog(@"runloop退出");
//                           break;
//                       default:
//                           break;
//                   }
//               });
//           CFRunLoopAddObserver(CFRunLoopGetCurrent(), observerRef, kCFRunLoopDefaultMode);
    }
    return self;
}

-(void)addSubTestView{
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.backgroundColor = [UIColor greenColor];
    backButton.frame = CGRectMake(0, 0, 50, 50);
    [backButton addTarget:self action:@selector(clickBackButton) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:backButton];
   
}

- (void)clickBackButton{
    NSLog(@"添加修改按钮");
    if (self.subLab == nil)
    {
        self.subLab = [[UILabel alloc]initWithFrame:CGRectMake(50, 0, 100, 40)];
        self.subLab.backgroundColor = [UIColor grayColor];
        [self addSubview:self.subLab];
        //[self setNeedsLayout];
        //[self layoutIfNeeded];
    }else{
        self.subLab.frame = CGRectMake(50, 0, 100, 40);
        [self setNeedsLayout];
        //[self layoutIfNeeded];
    }
    
}




-(void)layoutSubviews{
    [super layoutSubviews];
    NSLog(@"来到 layoutSubviews");
}



@end
