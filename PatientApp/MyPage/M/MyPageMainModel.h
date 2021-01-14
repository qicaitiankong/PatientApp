//
//  MyPageMainModel.h
//  PatientApp
//
//  Created by mac on 2020/10/14.
//”我的“主页

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyPageMainModel : NSObject
///
@property (copy,nonatomic) NSString *nameStr;
///
@property (copy,nonatomic) NSString *telephoneStr;
///
@property (copy,nonatomic) NSString *identityNumberStr;
///
@property (copy,nonatomic) NSString *patientId;
///
@property (copy,nonatomic) NSString *patientName;
///
@property (copy,nonatomic) NSString *patientNum;
///
@property (copy,nonatomic) NSString *patientSex;
///
@property (copy,nonatomic) NSString *patientSexName;
///
@property (copy,nonatomic) NSString *patientNation;
///
@property (copy,nonatomic) NSString *patientNationName;
///
@property (copy,nonatomic) NSString *patientMar;
///
//@property (copy,nonatomic) NSString *patientNationName;
//////
@property (copy,nonatomic) NSString *birthday;
///
@property (copy,nonatomic) NSString *address;
///
@property (copy,nonatomic) NSString *cardNum;
///
@property (copy,nonatomic) NSString *cardType;
///
@property (copy,nonatomic) NSString *orgId;
///
@property (copy,nonatomic) NSString *cartTypeName;
///
@property (copy,nonatomic) NSString *orgName;
///
@property (copy,nonatomic) NSString *tel;
///
@property (copy,nonatomic) NSString *operationTime;
///
@property (copy,nonatomic) NSString *operationBy;
///
@property (copy,nonatomic) NSString *isDelete;

@property (strong,nonatomic) NSNumber *ageNum;

@end

NS_ASSUME_NONNULL_END
