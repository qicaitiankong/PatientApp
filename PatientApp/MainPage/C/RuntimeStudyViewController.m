//
//  RuntimeStudyViewController.m
//  PatientApp
//
//  Created by Lizihao Li on 2021/2/3.
//

#import "RuntimeStudyViewController.h"
#import "Game.h"
#import <objc/runtime.h>
#import <objc/message.h>

@interface RuntimeStudyViewController ()
{
    NSInteger num;
}

@end

@implementation RuntimeStudyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    Game *game = [[Game alloc]init];
    [game DoThings:@"lzh" Num:100];
   // [game DoThings];
    //NSLog(@"_cmd:%@",NSStringFromSelector(_cmd));
    // Do any additional setup after loading the view.
//    void(*setter)(id,SEL,BOOL);
//    int i;
//    setter = (void (*)(id,SEL,BOOL))[self methodForSelector:@selector(setField:)];
//    for ( i = 0; i < 1000; i++)
//    {
//        setter(self,@selector(setField:),YES);
//    }
}

- (void)setField:(NSInteger)number{
    NSLog(@"%ld",++num);
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
