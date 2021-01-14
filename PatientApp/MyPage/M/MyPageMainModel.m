//
//  MyPageMainModel.m
//  PatientApp
//
//  Created by mac on 2020/10/14.
//

#import "MyPageMainModel.h"

@implementation MyPageMainModel


+ (MyPageMainModel*)getModelFromDict:(NSDictionary*)dict
{
    MyPageMainModel *mainModel = [[MyPageMainModel alloc]init];
    if (mainModel)
    {
        mainModel.patientId = [dict acquireStringValueByKey:@"patientId"];
        mainModel.patientName = [dict acquireStringValueByKey:@"patientName"];
        mainModel.patientNum = [dict acquireStringValueByKey:@"patientNum"];
        
        mainModel.cardNum = [dict acquireStringValueByKey:@"cardNum"];
        mainModel.tel = [dict acquireStringValueByKey:@"tel"];
    }
    return mainModel;
}

@end
