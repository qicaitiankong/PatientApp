//
//  BlockStudyViewController.m
//  PatientApp
//
//  Created by Lizihao Li on 2021/2/1.
//

#import "BlockStudyViewController.h"
//用typedef定义block
typedef int(^myBlock)(int, NSString*);

@interface BlockStudyViewController ()

@end

@implementation BlockStudyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //[self test01];
    //[self test02];
    [self test03];
    
}


/// block 底层分析
- (void)test03{
    static NSString *name = @"lzh";
    void(^ myBlock100)(void) = ^{
        NSLog(@"%@",name); //sdp
       // name = @"ghhg";
        
    };
    name = @"sdp";
    myBlock100();
    NSLog(@"%@",myBlock100);//<__NSGlobalBlock__: 0x1005a4ce8>
}

/// block 分类
- (void)test02{
    /*
     全局block：_NSConcreteGlobalBlock；存储在全局内存中，相当于单例。
     ② 栈block：_NSConcreteStackBlock；存储在栈内存中，超出其作用域则马上被销毁。
     ③ 堆block：_NSConcreteMallocBlock；存储在堆内存中，是一个带引用计数的对象，需要自行管理其内存。
     */
    //当我们遇到一个block，怎么去判定这个block的存储位置呢？
    //block不访问外部变量（包括栈和堆中的变量）,此时为全局block
//    void(^block05)(int) = ^(int num){
//
//    };
//    NSLog(@"%@",block05); //<__NSGlobalBlock__: 0x10070ce28>
//
    /*
     block访问外部变量
     MRC环境下：访问外部变量的block默认是存储在栈中的。
     ARC环境下：访问外部变量的block默认是存储在堆中的（实际是放在栈区，然后ARC情况下又自动拷贝到堆区），自动释放。
     */
    
//    int a1 = 30;
//    void(^block06)(int) = ^(int num){
//        NSLog(@"%d",a1);
//    };
//    NSLog(@"%@",block06); //<__NSMallocBlock__: 0x2822be400>
    //3 在ARC环境下我们怎么获取栈block呢？
    //此时我们通过__weak不进行强持有，block就还是栈区的block。
//    int c = 12;
//    void(^ __weak block08)(int) = ^(int num){
//        NSLog(@"%d",c);
//    };
//    NSLog(@"%@",block08);//<__NSStackBlock__: 0x16f1f37f8>
    
}

/// block 定义
- (void)test01{
    //block 表达式语句
       /*
        ^ 返回值类型(参数列表){表达式}
        */
       void(^block01)(void) = ^ {
           NSLog(@"无参数无返回值block");
       };
       block01();
       
       void(^block02)(int, int) = ^(int a, int b){
           NSLog(@"有参无返回值%d",a + b);
       };
       block02(3,5);
       //有参数有返回值
       int(^block03)(int ,int) = ^(int a, int b){
           return a + b;
       };
       NSLog(@"%d",block03(6,7));
       //无参数有返回值
       
       int(^block04)(void) = ^{
           return 90;
       };
       NSLog(@"%d",block04());
       
        myBlock block05 = ^(int a, NSString *name){
          return a;
        };
        NSLog(@"%d",block05(32,@"lzh"));
}


@end
