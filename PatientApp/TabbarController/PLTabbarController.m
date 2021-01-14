//
//  PLTabbarController.m
//  PatientApp
//
//  Created by mac on 2020/10/12.
//

#import "PLTabbarController.h"
#import "PLMainPageViewController.h"
#import "PLServiceViewController.h"
#import "PLMessageViewController.h"
#import "PLMyPageViewController.h"

@interface PLTabbarController ()<UITabBarControllerDelegate, UINavigationControllerDelegate>
{
    PLMainPageViewController *homeController;
    PLServiceViewController *serviceController;
    PLMessageViewController *messageController;
    PLMyPageViewController *myPageController;
}
@end

@implementation PLTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initObjects];
    self.delegate = self;
    
    homeController = [[PLMainPageViewController alloc] init];
    [self addControllerWithTitle:@"首页" imageName:@"icon_tab_01" selectImageName:@"icon_tab_01_sel" controller:homeController];
    
    serviceController = [[PLServiceViewController alloc] init];
    [self addControllerWithTitle:@"服务" imageName:@"icon_tab_02" selectImageName:@"icon_tab_02_sel" controller:serviceController];
    
    messageController = [[PLMessageViewController alloc]init];
    [self addControllerWithTitle:@"消息" imageName:@"icon_tab_03" selectImageName:@"icon_tab_03_sel" controller:messageController];
    
    myPageController = [[PLMyPageViewController alloc] init];
    [self addControllerWithTitle:@"我的" imageName:@"icon_tab_04" selectImageName:@"icon_tab_04_sel" controller:myPageController];
    self.currentSelectedNav = self.navArr[0];
}


- (void)initObjects{
    self.navArr = [[NSMutableArray alloc]init];
}
- (void)setGradientLayer {
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)[UIColor colorWithHexString:@"ffffff" alpha:1].CGColor, (__bridge id)[UIColor colorWithHexString:@"ffffff" alpha:0.5].CGColor];
    gradientLayer.locations = @[@0.0,@0.5];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    gradientLayer.frame = CGRectMake(0, 0, self.tabBar.frame.size.width, self.tabBar.frame.size.height);
    [self.tabBar.layer addSublayer:gradientLayer];
}
-(void)setSelectedIndex:(NSUInteger)selectedIndex{
    [super setSelectedIndex:selectedIndex];
    if(self.navArr.count > selectedIndex)
    {
        self.currentSelectedNav = self.navArr[selectedIndex];
    }
}

#pragma mark - 设置底部控制器
- (void)addControllerWithTitle:(NSString *)title imageName:(NSString *)imageName selectImageName:(NSString *)selectImageName controller:(UIViewController *)controller {
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controller];
    [self.navArr addObject:nav];
    controller.tabBarItem.image = [[UIImage imageNamed:imageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    controller.title = title;
    controller.tabBarItem.selectedImage = [[UIImage imageNamed:selectImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [nav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"0x595E6B"]} forState:UIControlStateNormal];
    [nav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"0x1A93CB"]} forState:UIControlStateSelected];
    [self addChildViewController:nav];
}

#pragma mark -- UITabBarControllerDelegate

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    if(self.navArr.count > tabBarController.selectedIndex)
    {
        self.currentSelectedNav = self.navArr[tabBarController.selectedIndex];
    }
}



@end
