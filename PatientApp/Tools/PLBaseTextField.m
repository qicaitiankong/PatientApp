//
//  PLBaseTextField.m
//  PatientApp
//
//  Created by mac on 2020/10/15.
//

#import "PLBaseTextField.h"

@interface PLBaseTextField ()<UITextFieldDelegate>



@end

@implementation PLBaseTextField

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        self.textField.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        self.textField.returnKeyType = UIReturnKeyDone;
        self.textField.backgroundColor = [UIColor whiteColor];
        self.textField.delegate = self;
        [self addSubview:self.textField];
        [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.mas_equalTo(self);
        }];
    }
    return self;
}

-(UITextField *)textField
{
    if (_textField == nil)
    {
        _textField = [[UITextField alloc]initWithFrame: CGRectZero];
    }
    return _textField;
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return  YES;
}

@end
