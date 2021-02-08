//
//  CustomJSObject.h
//  PatientApp
//
//  Created by Lizihao Li on 2021/2/8.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

typedef void(^JSObjectBlock)(NSDictionary *dic);


NS_ASSUME_NONNULL_BEGIN
/*
 JSExport:协议，将oc 中的 类，实例方法，类方法，属性 导入到java script
 */
@protocol CustomJSProtocol <JSExport>
// 要和h5代码中的方法一致
- (void)helloWQL;

- (void)sendValueFromHtmlToOCWithValue:(NSString*)str1;
//传两个值时第二个参数大写
- (void)sendValueFromHtmlToOCWithValue:(NSString*)str1 WithValueTwo:(NSString*)str2;
//让oc传值给H5
- (void)sendValueToHtml;

@end

@interface CustomJSObject : NSObject<CustomJSProtocol>

- (id)initWithSuccessCallback:(JSObjectBlock)success faileCallback:(JSObjectBlock)fail;

/**
 *  成功的block
 **/
@property (nonatomic,copy) JSObjectBlock successBlock;

/**
 *  失败的block
 **/
@property (nonatomic,copy) JSObjectBlock failBlock;


/**
 *  操作数组
 **/
@property (nonatomic,strong) NSMutableArray *actionsArray;



@end

NS_ASSUME_NONNULL_END
