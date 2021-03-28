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
#import "RuntimeModel.h"
#import "NSObject+RuntimeModel.h"
#import "RuntimeStudent+Zh.h"
#import "NSArray+BurryPoint.h"
#import "ZHPerson.h"
#import "ZHPerson+Sport.h"
#import "ZHPerson+Eat.h"
#import "ZHStudent.h"
#import "ZHStudent+Study.h"
#import "ZHDog.h"


@interface RuntimeStudyViewController ()
{
    NSInteger num;
}

@end

@implementation RuntimeStudyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    Game *game = [[Game alloc]init];
//    [game DoThings:@"lzh" Num:100];
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
      //runtime 字典转模型
//    NSDictionary *dict = @{
//        @"Name":@"sdff",
//        @"Type":@"oooop",
//        @"Des": @"jkjkj",
//        @"Motto": @"sddddd"
//    };
//    RuntimeModel *model = [RuntimeModel initWithDictionaryForModel:dict];
//    NSLog(@"%@--%@--%@--%@",model.Name,model.Type,model.Des,model.Motto);
    //方法交换
//    RuntimeStudent *student = [[RuntimeStudent alloc]init];
//    [student test];
    //数组越界埋点
//    NSArray *strArr = @[@1,@2,@3];
//    NSArray *arr2 = @[];
//    NSArray *arr3 = @[@1];
//    NSMutableArray *arr4 = [NSMutableArray arrayWithObject:@"1"];
//    NSMutableArray *arr5 = [NSMutableArray arrayWithArray:arr2];
//    NSLog(@"strArr:%@\n,arr2=%@\n,arr3=%@\n,arr4=%@\n,arr5=%@\n",[strArr class],[arr2 class],[arr3 class],[arr4 class],[arr5 class]);
//
//    NSLog(@"%@ %@ %@ %@ %@ %@",strArr[6],[arr2 objectAtIndex:1],arr2[7],[strArr objectAtIndex:5],arr3[6],[arr4 objectAtIndex:4]);
    //分类探讨
    //[ZHPerson class];
    //ZHPerson *person = [[ZHPerson alloc]init];
    //ZHStudent *student = [[ZHStudent alloc]init];
    //ZHDog *dog = [[ZHDog alloc]init];
    
    ZHPerson *person = [[ZHPerson alloc]init];
    [person test01];
    
    
}

- (void)setField:(NSInteger)number{
    NSLog(@"%ld",++num);
}




@end
