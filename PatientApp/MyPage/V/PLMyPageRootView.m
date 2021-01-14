//
//  PLMyPageRootView.m
//  PatientApp
//
//  Created by mac on 2020/10/13.
//

#import "PLMyPageRootView.h"
#import "PLMyPageBaseScrollView.h"

@interface PLMyPageRootView ()
{
    PLMyPageBaseScrollView *scrollView;
}

@end

@implementation PLMyPageRootView

-(instancetype)initWithFrame:(CGRect)frame withViewModel:(MyPageMainViewModel*)localViewModel
{
    self = [super initWithFrame:frame];
    if (self)
    {
        scrollView = [[PLMyPageBaseScrollView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) withViewModel:localViewModel];
        [self addSubview:scrollView];
    }
    return self;
}

@end
