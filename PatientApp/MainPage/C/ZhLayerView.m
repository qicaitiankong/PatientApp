//
//  ZhLayerView.m
//  PatientApp
//
//  Created by Lizihao Li on 2021/3/17.
//

#import "ZhLayerView.h"
#import "ZhLayer.h"
@interface ZhLayerView ()

@property (nonatomic, strong) ZhLayer *myLayer;

@end


@implementation ZhLayerView

/*
 如果使用CALayer绘图，就不要再写drawRect方法
 */


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.myLayer = [ZhLayer layer];
        [self.myLayer setBounds:self.bounds];
        [self.myLayer setPosition:CGPointMake(100, 100)];
        [self.myLayer setBackgroundColor:[UIColor redColor].CGColor];
        [self.layer addSublayer:self.myLayer];
        [self.myLayer setNeedsDisplay];
    }
    return self;
}



@end
