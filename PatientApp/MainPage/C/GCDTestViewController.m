//
//  GCDTestViewController.m
//  PatientApp
//
//  Created by Lizihao Li on 2021/2/7.
//

#import "GCDTestViewController.h"
#import "PLMyPageNetWork.h"

@interface GCDTestViewController ()

@end

@implementation GCDTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    /*
     let urlString = "http://47.104.255.147:8089/SMBMS/marry/myCollects"
            let param = ListDataRequestParam(userId: 162, page: page, type: 1)
     */
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_semaphore_t semaphere = dispatch_semaphore_create(0);
    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
        NSLog(@"01开始执行");
            [PLMyPageNetWork testRequest:@{@"userId":@162,@"page":@1,@"type":@1} withBlock:^(id  _Nonnull response) {
                NSLog(@"\n\n -----01 complete -------\n\n");
                dispatch_semaphore_signal(semaphere);
            } withErrorBlock:^(id  _Nonnull response) {
                dispatch_semaphore_signal(semaphere);
            }];
    });
    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
         dispatch_semaphore_wait(semaphere, DISPATCH_TIME_FOREVER);
        NSLog(@"02开始执行");
            [PLMyPageNetWork testRequest:@{@"userId":@162,@"page":@1,@"type":@1} withBlock:^(id  _Nonnull response) {
                dispatch_semaphore_signal(semaphere);
                NSLog(@"\n\n -----02 complete -------\n\n");
            } withErrorBlock:^(id  _Nonnull response) {
                dispatch_semaphore_signal(semaphere);
            }];
    });
    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
        dispatch_semaphore_wait(semaphere, DISPATCH_TIME_FOREVER);
        NSLog(@"03开始执行");
            [PLMyPageNetWork testRequest:@{@"userId":@162,@"page":@1,@"type":@1} withBlock:^(id  _Nonnull response) {
                dispatch_semaphore_signal(semaphere);
               NSLog(@"\n\n -----03 complete -------\n\n");
            } withErrorBlock:^(id  _Nonnull response) {
                dispatch_semaphore_signal(semaphere);
            }];
    });
    
    dispatch_group_notify(group, dispatch_get_global_queue(0, 0), ^{
        dispatch_semaphore_wait(semaphere, DISPATCH_TIME_FOREVER);
        NSLog(@"group_notify 通知");
        
    });
    
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
