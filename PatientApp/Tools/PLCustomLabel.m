//
//  PLCustomLabel.m
//  PatientApp
//
//  Created by mac on 2020/10/13.
//

#import "PLCustomLabel.h"

@implementation PLCustomLabel

- (instancetype)initWithCustomerParamer:(UIFont*)font titleColor:(UIColor*)titleColor aligement:(NSTextAlignment)aligenment
{
    self = [super init];
    if (self)
    {
        if(font)
        {
            self.font = font;
        }
        if(titleColor)
        {
            self.textColor = titleColor;
        }else
        {
            self.textColor = [UIColor blackColor];
        }
        if(aligenment >= 0)
        {
            self.textAlignment = aligenment;
        }
        
    }
    return self;
}

@end
