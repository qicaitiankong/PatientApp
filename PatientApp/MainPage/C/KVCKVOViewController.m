//
//  KVCKVOViewController.m
//  PatientApp
//
//  Created by Lizihao Li on 2021/2/14.
//

#import "KVCKVOViewController.h"
#import "KvckvoPerson.h"

@interface KVCKVOViewController ()

@end

@implementation KVCKVOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    KvckvoPerson *p = [[KvckvoPerson alloc]init];
    p.name = @"javck";
    p.age = 123;
    [p setValue:@"qwer" forKey:@"name"];
    NSLog(@"p.name=%@",p.name);
    //
    [p setValue:@"a huang" forKeyPath:@"dog.name"];
    [p.dog setValue:@"b huang" forKey:@"name"];
    NSLog(@"dog.name=%@",p.dog.name);
    
    [p setValue:@"gouguo" forKey:@"name2"];
    NSLog(@"name2 = %@",[p valueForKey:@"name2"]);
    
    
    
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
