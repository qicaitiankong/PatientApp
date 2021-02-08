//
//  H5TestViewController.m
//  PatientApp
//
//  Created by Lizihao Li on 2021/2/8.
//

#import "H5TestViewController.h"
#import "CustomJSObject.h"

@interface H5TestViewController ()<UIWebViewDelegate>
{
    BOOL loadComplete;
}

@property (strong,nonatomic) UIWebView *webView;

@end

@implementation H5TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [NSThread currentThread].name = @"weuiwe";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *ocButton = [UIButton buttonWithType:UIButtonTypeCustom];
    ocButton.backgroundColor = [UIColor grayColor];
    [ocButton setTitle:@"oc按钮调取h5方法" forState:UIControlStateNormal];
    [ocButton addTarget:self action:@selector(clickOcButton) forControlEvents:UIControlEventTouchUpInside];
    ocButton.frame = CGRectMake(10, IPHONE_NAVIGATIONBAR_HEIGHT, 100, 50);
    [self.view addSubview:ocButton];
    
    //
    self.webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, IPHONE_NAVIGATIONBAR_HEIGHT + 60, SCREEN_WIDTH, SCREEN_HEIGHT - IPHONE_NAVIGATIONBAR_HEIGHT - 60)];
    self.webView.delegate = self;
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSURL *baseUrl = [NSURL fileURLWithPath:path];
    NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"File" ofType:@"html"];
    NSString *htmlCont = [NSString stringWithContentsOfFile:htmlPath encoding:NSUTF8StringEncoding error:nil];
    [self.webView loadHTMLString:htmlCont baseURL:baseUrl];
    [self.view addSubview:self.webView];
    //
}

- (void)clickOcButton{
    if (loadComplete)
    {
        JSContext *context = [self.webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
        CustomJSObject *object = [CustomJSObject new];
        //methodForOC()为H5中的方法
        NSString *textJS = [NSString stringWithFormat:@"methodForOC()"];
        [context evaluateScript:textJS];
        context[@"native"] = object;
    }
}


-(void)webViewDidFinishLoad:(UIWebView *)webView{
    //加载完成后注入object，让我们可以得到html的点击事件
    loadComplete = YES;
    NSLog(@"webViewDidFinishLoad");
    [self addCustomAction];
}

- (void)addCustomAction
{
    //获取context 这里的path 是固定的
    JSContext *context = [self.webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    //自定义的JS对象，需要注入到context中
    CustomJSObject *object = [[CustomJSObject alloc]initWithSuccessCallback:^(NSDictionary *dic) {
        if ([dic.allKeys.firstObject isEqualToString:@"helloWQL"])
        {
            [self clickH5Button];
        }
        if ([dic.allKeys.firstObject isEqualToString:@"singleValueKey"])
        {
            NSLog(@"H5单个参数传给oc的值%@",dic[@"singleValueKey"]);
        }
        
        if ([dic.allKeys containsObject:@"firstValueKey"]){
            NSLog(@"H5两个个参数传给oc的值 firstStr = %@,secondStr=%@",dic[@"firstValueKey"],dic[@"secondValueKey"]);
        }
        if ([dic.allKeys containsObject:@"ocSendValueToH5"]){
            NSString *textJs = [NSString stringWithFormat:@"getUserNameAndAge('%@','%@')",@"lzh",@"27"];
            [context evaluateScript:textJs];
        }
        
        
    } faileCallback:^(NSDictionary *dic) {
        NSLog(@"faliser");
    }];
    ////这里要使用native，html那边调用的是native
    context[@"native"] = object;
    
    
}

- (void)clickH5Button{
    NSLog(@"oc 接收到H5按钮点击事件");
}



@end
