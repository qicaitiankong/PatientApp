//
//  NSTimerViewController.m
//  PatientApp
//
//  Created by Lizihao Li on 2021/3/15.
//

#import "NSTimerViewController.h"
#import <objc/runtime.h>
#import "ZHProxy.h"


@interface NSTimerViewController ()
@property (nonatomic,strong) NSTimer *timer;
//引入中间者
@property (nonatomic,strong) id target;

//高级中间者
@property (nonatomic, strong) ZHProxy *proxy;
@end
@implementation NSTimerViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
   // _target = [NSObject new];
    //给中间类动态添加方法
    //class_addMethod([_target class], @selector(test), class_getMethodImplementation([self class], @selector(test)), "v@:");
    
    //虚基类只有alloc方法，所以初始化，直接调用alloc
    
    //_proxy = [ZHProxy alloc];
    //_proxy.target = self;
    //_timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:_proxy selector:@selector(test) userInfo:nil repeats:YES];
    
    __weak typeof(self) weakSelf = self;
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf test];
    }];
    
    
    
    
    
    
}
- (void)test{
    NSLog(@"nstimer 定时器打印");
}
- (void)dealloc
{
    [_timer invalidate];
    _timer = nil;
    NSLog(@"%@ dealloc",self);
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
