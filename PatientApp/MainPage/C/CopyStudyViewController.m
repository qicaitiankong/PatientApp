//
//  CopyStudyViewController.m
//  PatientApp
//
//  Created by Lizihao Li on 2021/2/2.
//

#import "CopyStudyViewController.h"
#import "Person.h"


@interface CopyStudyViewController ()

@end

@implementation CopyStudyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
//    NSString *str1 = @"非容器不可变对象";
//    NSString *str2 = [str1 copy];
//    NSString *str3 = [str1 mutableCopy];
//    NSLog(@"str1_p: %p, class:%@",str1,[str1 class]);
//    NSLog(@"str2-p:%p, class:%@",str2,[str2 class]);
//    NSLog(@"str3_p: %p class:%@",str3,[str3 class]);
    
//    NSMutableString *str1 = [NSMutableString stringWithFormat:@"非容器可变对象"];
//    NSMutableString *str2 = [str1 copy];
//    NSMutableString *str3 = [str1 mutableCopy];
//
//    NSLog(@"str1_p: %p,class:%@",str1,[str1 class]);
//    NSLog(@"str2_p: %p,class:%@",str2,[str2 class]);
//    NSLog(@"str3_p:%p,class:%@",str3,[str3 class]);
    
//    NSMutableString *str1 = [NSMutableString stringWithFormat:@"非容器可变对象"];
//    NSArray *array = [NSArray arrayWithObjects:str1,@"非容器不可变对象",nil];
//    NSArray *copyArray = [array copy];
//    NSArray *mutableCopyArray = [array mutableCopy];
//
//    NSLog(@"array_p:%p class:%@",array,[array class]);
//    NSLog(@"copyArray_p:%p class:%@",copyArray,[copyArray class]);
//    NSLog(@"mutableCopyArray_p:%p class:%@",mutableCopyArray,[mutableCopyArray class]);
//
//    NSLog(@"==== 原对象 ====\n");
//    NSLog(@"object_p: %p,class: %@",array[0],[array[0] class]);
//    NSLog(@"object_p: %p,class:%@",array[1],[array[1] class]);
//
//    NSLog(@"===copy对象===\n");
//    NSLog(@"object_p:%p, class:%@",copyArray[0],[copyArray[0] class]);
//    NSLog(@"object_p:%p, class:%@",copyArray[1],[copyArray[1] class]);
//
//    NSLog(@"===mutableCopy对象====\n");
//    NSLog(@"object_p:%p,class:%@",mutableCopyArray[0],[mutableCopyArray[0] class]);
//    NSLog(@"object_p:%p,class:%@",mutableCopyArray[1],[mutableCopyArray[1] class]);
//容器可变对象
//        NSMutableString *str1 = [NSMutableString stringWithFormat:@"非容器可变对象"];
//        NSMutableArray *array = [NSMutableArray arrayWithObjects:str1,@"非容器不可变对象",nil];
//        NSArray *copyArray = [array copy];
//        NSArray *mutableCopyArray = [array mutableCopy];
//
//        NSLog(@"array_p:%p class:%@",array,[array class]);
//        NSLog(@"copyArray_p:%p class:%@",copyArray,[copyArray class]);
//        NSLog(@"mutableCopyArray_p:%p class:%@",mutableCopyArray,[mutableCopyArray class]);
//
//        NSLog(@"==== 原对象 ====\n");
//        NSLog(@"object_p: %p,class: %@",array[0],[array[0] class]);
//        NSLog(@"object_p: %p,class:%@",array[1],[array[1] class]);
//        NSLog(@"===copy对象===\n");
//        NSLog(@"object_p:%p, class:%@",copyArray[0],[copyArray[0] class]);
//        NSLog(@"object_p:%p, class:%@",copyArray[1],[copyArray[1] class]);
//        NSLog(@"===mutableCopy对象====\n");
//        NSLog(@"object_p:%p,class:%@",mutableCopyArray[0],[mutableCopyArray[0] class]);
//        NSLog(@"object_p:%p,class:%@",mutableCopyArray[1],[mutableCopyArray[1] class]);
    //自定义对象拷贝
    
    Person *person = [[Person alloc]init];
    Person *copyPerson = [person copy];
    Person *mutablePerson = [person mutableCopy];
    NSArray *array = [NSArray arrayWithObjects:copyPerson,mutablePerson, nil];
    NSMutableArray *mutableArr = [[NSMutableArray alloc]initWithArray:array copyItems:YES];
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:mutableArr];
    NSMutableArray *newMuatbleArr = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    NSLog(@"===原对象==\n");
    NSLog(@"array[0]: %p array[1]:%p",array[0],array[1]);
    NSLog(@"===新对象==\n");
    NSLog(@"mutableArr[0]: %p mutableArr[1]:%p",mutableArr[0],mutableArr[1]);
    NSLog(@"===完全拷贝对象==\n");
    NSLog(@"newMuatbleArr[0]: %p newMuatbleArr[1]:%p",newMuatbleArr[0],newMuatbleArr[1]);
    
    
    
}



@end
