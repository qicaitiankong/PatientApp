//
//  NSString+JSString.m
//  JSEDU
//
//  Created by 金石 on 2018/6/14.
//  Copyright © 2018年 孔祥刚. All rights reserved.
//

#import "NSString+JSString.h"
#import <AdSupport/AdSupport.h>
#import <CommonCrypto/CommonDigest.h>
#import "NSData+HSData.h"

@implementation NSString (JSString)


#pragma mark -- 为字符串设置不同格式的字体,颜色
- (NSMutableAttributedString *)setAttributedWithIdentifyStringArray:(NSArray *)identifyStringArray colors:(NSArray *)colors fonts:(NSArray *)fonts {
    
    if (!self && !identifyStringArray) {
        return nil;
    }
    if (!identifyStringArray.count) {
        return nil;
    }
    NSAssert(identifyStringArray.count == colors.count && colors.count == fonts.count, @"字符串的数量和颜色，字体的数量不相等");
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]initWithString:self];
    for (int i = 0; i < identifyStringArray.count; i ++) {
        NSString *identifyString = identifyStringArray[i];
        UIColor *color = colors[i];
        UIFont *font = fonts[i];
        NSRange range = [self rangeOfString:identifyString];
        if (font) {
            [attributedStr addAttribute:NSFontAttributeName value:font range:range];
        }
        if (color) {
            [attributedStr addAttribute:NSForegroundColorAttributeName value:color range:range];
        }
    }
    
    return attributedStr;
}


#pragma mark -- 为字符串设置不同格式的字体,颜色,插入图片
- (NSMutableAttributedString *)setAttributedWithIdentifyStringArray:(NSArray *)identifyStringArray colors:(NSArray *)colors fonts:(NSArray *)fonts imageNames:(NSArray *)imageNames indexs:(NSArray *)indexs bounds:(CGRect)bounds {
    // 富文本技术：
    // 1.图文混排
    // 2.随意修改文字样式
    NSString *titleStr = self;
    if (!self && !identifyStringArray) {
        return nil;
    }
    if (!identifyStringArray.count) {
        return nil;
    }
    NSAssert(identifyStringArray.count == colors.count && colors.count == fonts.count && imageNames.count == indexs.count, @"字符串的数量和颜色，字体的数量不相等或者图片的数量和下标的数量不相等");
    
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]initWithString:titleStr];
    for (int i = 0; i < identifyStringArray.count; i ++) {
        NSString *identifyString = identifyStringArray[i];
        UIColor *color = colors[i];
        UIFont *font = fonts[i];
        NSRange range = [self rangeOfString:identifyString];
        if (font) {
            [attributedStr addAttribute:NSFontAttributeName value:font range:range];
        }
        if (color) {
            [attributedStr addAttribute:NSForegroundColorAttributeName value:color range:range];
        }
    }
    
    //拿到整体的字符串
    for (int i = 0; i < imageNames.count; i ++) {
        // 创建图片图片附件
        NSTextAttachment *attach = [[NSTextAttachment alloc] init];
        attach.image = [UIImage imageNamed:imageNames[i]];
        attach.bounds = bounds;
        NSAttributedString *attachString = [NSAttributedString attributedStringWithAttachment:attach];
        //将图片插入到合适的位置
        [attributedStr insertAttributedString:attachString atIndex:[indexs[i] intValue]];
    }
    return attributedStr;
}



#pragma mark -- 设置行间距
- (NSAttributedString *)getAttributedStringWithLineSpace:(CGFloat)lineSpace {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpace; // 调整行间距
    NSRange range = NSMakeRange(0, [self length]);
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
    return attributedString;
}




#pragma mark -- 根据字符串内容和字体,高度获取宽度
- (CGFloat)getStringWidthWithFont:(UIFont *)font height:(CGFloat)height {
    
    CGSize size = [self sizeForFont:font size:CGSizeMake(HUGE, height) mode:NSLineBreakByWordWrapping];
    return ceilf(size.width);
//    CGSize size = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options:NSStringDrawingTruncatesLastVisibleLine attributes:@{NSFontAttributeName:[UIFont jsFontWithSize:font.pointSize]} context:nil].size;
//    return size.width;
}



#pragma mark -- 根据字符串内容和字体，宽度获取高度
- (CGFloat)getStringHeightWithFont:(UIFont *)font width:(CGFloat)width {
    CGSize size = [self sizeForFont:font size:CGSizeMake(width, HUGE) mode:NSLineBreakByWordWrapping];
    return ceilf(size.height);
    
//    CGSize size = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont jsFontWithSize:font.pointSize]} context:nil].size;
//    return size.height;
}

+ (CGFloat)getAttributeStringHeightWithFont:(CGFloat)width attributeStr:(NSAttributedString*)attributeStr{
    CGSize attSize = [attributeStr boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;

    return ceilf(attSize.height);
    
}

- (CGFloat)getLabelHeightWithLineSpace:(NSDictionary*)attributeDict labelWidth:(CGFloat)width{
    CGRect rect = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributeDict context:nil];
    return ceilf(rect.size.height);
}



- (CGSize)sizeForFont:(UIFont *)font size:(CGSize)size mode:(NSLineBreakMode)lineBreakMode {
    CGSize result;
    if (!font) font = [UIFont systemFontOfSize:12];
    if ([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSMutableDictionary *attr = [NSMutableDictionary new];
        attr[NSFontAttributeName] = font;
        if (lineBreakMode != NSLineBreakByWordWrapping) {
            NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
            paragraphStyle.lineBreakMode = lineBreakMode;
            attr[NSParagraphStyleAttributeName] = paragraphStyle;
        }
        CGRect rect = [self boundingRectWithSize:size
                                         options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                      attributes:attr context:nil];
        result = rect.size;
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        result = [self sizeWithFont:font constrainedToSize:size lineBreakMode:lineBreakMode];
#pragma clang diagnostic pop
    }
    return result;
}



#pragma mark -- 第一个字符是否是数字
- (BOOL)firstIsNumber {
    if (!self || [self length] == 0) {
        return NO;
    }
    
    return [[[self componentsSeparatedByString:@"."] firstObject] isNumber];
}

#pragma mark -- 是否是汉字
- (BOOL)isChinese {
    if (!self) {
        return NO;
    }
    NSString *regex = @"[\u4e00-\u9fa5]";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([pred evaluateWithObject:self]) {
        return YES;
    }
    return NO;
}
#pragma mark -- 是否是数字
- (BOOL)isNumber {
    if (!self) {
        return NO;
    }
    NSString *regex = @"^\\-?[0-9]+(\\.[0-9]+)?$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([pred evaluateWithObject:self]) {
        return YES;
    }
    return NO;
}

#pragma mark -- 是否包含数字
- (BOOL)isStringContainNumber {
    if (!self || self.length == 0) {
        return NO;
    }
    
    
    NSRegularExpression *numberRegular = [NSRegularExpression regularExpressionWithPattern:@"[0-9]" options:NSRegularExpressionCaseInsensitive error:nil];
    
    NSInteger count = [numberRegular numberOfMatchesInString:self options:NSMatchingReportProgress range:NSMakeRange(0, self.length)];
    
    
    if (count > 0) {
        
        return YES;
        
    }
    return NO;
}



#pragma mark -- 是否包含字母
- (BOOL)isStringContainLetter {
    
    if (!self || self.length == 0) {
        return NO;
    }
    
    
    NSRegularExpression *numberRegular = [NSRegularExpression regularExpressionWithPattern:@"[A-Za-z]" options:NSRegularExpressionCaseInsensitive error:nil];
    
    NSInteger count = [numberRegular numberOfMatchesInString:self options:NSMatchingReportProgress range:NSMakeRange(0, self.length)];
    
    
    if (count > 0) {
        
        return YES;
        
    }
    return NO;
}

- (BOOL)isStringContainBigLetter {
    
    if (!self || self.length == 0) {
        return NO;
    }
    
    NSRegularExpression *numberRegular = [NSRegularExpression regularExpressionWithPattern:@"[A-Z]" options:NSRegularExpressionCaseInsensitive error:nil];
    
    NSInteger count = [numberRegular numberOfMatchesInString:self options:NSMatchingReportProgress range:NSMakeRange(0, self.length)];
    
    
    if (count > 0) {
        
        return YES;
        
    }
    return NO;
}

- (BOOL)isStringContainSmallLetter {
    
    if (!self || self.length == 0) {
        return NO;
    }
    
    NSRegularExpression *numberRegular = [NSRegularExpression regularExpressionWithPattern:@"[a-z]" options:NSRegularExpressionCaseInsensitive error:nil];
    
    NSInteger count = [numberRegular numberOfMatchesInString:self options:NSMatchingReportProgress range:NSMakeRange(0, self.length)];
    if (count > 0) {
        return YES;
    }
    return NO;
}


#pragma mark -- 是否是手机号
- (BOOL)isMobilePhoneNumber
{
    
    NSString *mobilePhoneNumber = self;
    mobilePhoneNumber = [mobilePhoneNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (self.length != 11)
    {
        return NO;
    }else
    {
        /**
         * 移动号段正则表达式
         */
        NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
        /**
         * 联通号段正则表达式
         */
        NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
        /**
         * 电信号段正则表达式
         */
        NSString *CT_NUM = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
        BOOL isMatch1 = [pred1 evaluateWithObject:mobilePhoneNumber];
        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
        BOOL isMatch2 = [pred2 evaluateWithObject:mobilePhoneNumber];
        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
        BOOL isMatch3 = [pred3 evaluateWithObject:mobilePhoneNumber];

        if (isMatch1 || isMatch2 || isMatch3)
        {
            return YES;
        }else
        {
            return NO;
        }
    }
}




#pragma mark -- base64编码
- (NSString *)base64Encode {
    
    NSData *encodeData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64String = [encodeData base64EncodedStringWithOptions:0];
    return base64String;
}



#pragma mark -- base64解码
- (NSString *)base64decode {
    
    NSData *data = [NSData dataWithBase64EncodedString:self];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

}


//传入 秒  得到  xx分钟xx秒
+ (NSString *)getMMSSFromSS:(NSString *)totalTime{
    NSInteger seconds = [totalTime integerValue];
    //format of minute
    NSString *str_minute = [NSString stringWithFormat:@"%ld",seconds/60];
    //format of second
    NSString *str_second = [NSString stringWithFormat:@"%ld",seconds%60];
    //format of time
    NSString *format_time = [NSString stringWithFormat:@"%@分%@秒",str_minute,str_second];
    
    //NSLog(@"format_time : %@",format_time);
    return format_time;
    
}

+ (NSString*)getTargetOrderNumberInsertSpaceByFour:(NSString*)orderNumber{
    NSMutableArray *numberArr = [[NSMutableArray alloc]init];
    NSMutableString *mutableStr = [NSMutableString stringWithString:orderNumber];
    while (mutableStr.length > 4) {
        NSString *singleStr = [[mutableStr substringToIndex:4] copy];
        [mutableStr deleteCharactersInRange:NSMakeRange(0, 4)];
        [numberArr addObject:singleStr];
    }
    if(mutableStr.length > 0){
        [numberArr addObject:[mutableStr copy]];
    }
    NSMutableString *resultStr = [[NSMutableString alloc]init];
    for (NSString *singleStr in numberArr){
        [resultStr appendFormat:@"%@ ",singleStr];
    }
    return resultStr;
    
}


+ (NSString*)getHiddenMobileStr:(NSString*)numberStr{
    NSMutableString *mobStr = [NSMutableString stringWithString:@""];
    if(mobStr.length == 11){
        mobStr = [NSMutableString stringWithString:numberStr];
        [mobStr replaceCharactersInRange:NSMakeRange(3, 5) withString:@"****"];
    }
    return mobStr;
}


/**
 *  将阿拉伯数字转换为中文数字
 */
+(NSString *)translationArabicNum:(NSInteger)arabicNum
{
    NSString *arabicNumStr = [NSString stringWithFormat:@"%ld",(long)arabicNum];
    NSArray *arabicNumeralsArray = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0"];
    NSArray *chineseNumeralsArray = @[@"一",@"二",@"三",@"四",@"五",@"六",@"七",@"八",@"九",@"零"];
    NSArray *digits = @[@"个",@"十",@"百",@"千",@"万",@"十",@"百",@"千",@"亿",@"十",@"百",@"千",@"兆"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjects:chineseNumeralsArray forKeys:arabicNumeralsArray];
    
    if (arabicNum < 20 && arabicNum > 9) {
        if (arabicNum == 10) {
            return @"十";
        }else{
            NSString *subStr1 = [arabicNumStr substringWithRange:NSMakeRange(1, 1)];
            NSString *a1 = [dictionary objectForKey:subStr1];
            NSString *chinese1 = [NSString stringWithFormat:@"十%@",a1];
            return chinese1;
        }
    }else{
        NSMutableArray *sums = [NSMutableArray array];
        for (int i = 0; i < arabicNumStr.length; i ++)
        {
            NSString *substr = [arabicNumStr substringWithRange:NSMakeRange(i, 1)];
            NSString *a = [dictionary objectForKey:substr];
            NSString *b = digits[arabicNumStr.length -i-1];
            NSString *sum = [a stringByAppendingString:b];
            if ([a isEqualToString:chineseNumeralsArray[9]])
            {
                if([b isEqualToString:digits[4]] || [b isEqualToString:digits[8]])
                {
                    sum = b;
                    if ([[sums lastObject] isEqualToString:chineseNumeralsArray[9]])
                    {
                        [sums removeLastObject];
                    }
                }else
                {
                    sum = chineseNumeralsArray[9];
                }
                
                if ([[sums lastObject] isEqualToString:sum])
                {
                    continue;
                }
            }
            
            [sums addObject:sum];
        }
        NSString *sumStr = [sums  componentsJoinedByString:@""];
        NSString *chinese = [sumStr substringToIndex:sumStr.length-1];
        return chinese;
    }
}


//精确计算富文本高度
+ (CGFloat)calculateAttributeTitleHeight:(NSAttributedString*)courseNameAttStr width:(CGFloat)labelWidth textFont:(UIFont*)font
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectZero];
    label.font = font;
    label.numberOfLines = 0;
    [label setAttributedText:courseNameAttStr];
    [label setFrame:CGRectMake(0, 0, labelWidth, 0)];
    [label sizeToFit];
    return label.height;
}

//精确计算普通文本高度
+ (CGFloat)calculateNomalTitleHeight:(NSString*)titleStr width:(CGFloat)labelWidth textFont:(UIFont*)font
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectZero];
    label.font = font;
    label.numberOfLines = 0;
    [label setText:titleStr];
    [label setFrame:CGRectMake(0, 0, labelWidth, 0)];
    [label sizeToFit];
    return label.height;
}


+ (NSString*)filterSpecialCharacterInString:(NSString*)targetStr
{
    if (targetStr)
    {
        NSString *firstDealStr = [targetStr stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        NSString *secondDealStr = [firstDealStr stringByReplacingOccurrencesOfString:@"\r" withString:@""];
        return secondDealStr;
    }
    return @"";
}

+ (NSString*)getIdfaStr
{
    // 获取IDFA
    NSString * idfaStr = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    if (nil == idfaStr)
    {
        idfaStr = @"";
    }
    return idfaStr;
}
//获取时间戳字符串
+ (NSString *)stringWithDate:(NSDate *)date{
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"YYYY-MM-dd HH:mm:ss";
    // 将时间转为当前时区
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    NSInteger interval = [timeZone secondsFromGMTForDate:date];
    NSDate *localeDate = [date  dateByAddingTimeInterval:-interval];
    NSString *str = [formatter stringFromDate:localeDate];
    return str;
}

//得到当前时间的字符串格式为：2019-10-09
+ (NSString*)getTargetCurrentTimeStr
{
    NSDate *currentDate = [NSDate dateWithTimeIntervalSinceNow:8 * 3600];
    NSString *currentDateStr = [NSString stringWithDate:currentDate];
    NSMutableString *mutableDateStr = [[NSMutableString alloc]initWithString:currentDateStr];
    //得到 2019-10-09格式
    NSArray *subStrArr = [mutableDateStr componentsSeparatedByString:@" "];
    if (subStrArr.count)
    {
        mutableDateStr = subStrArr[0];
    }
//    NSLog(@"mutableDateStr=%@",mutableDateStr);
    return mutableDateStr;
}

+ (NSDictionary *)convertToDictionary:(NSString *)jsonStr {
    NSData *data = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *tempDic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    return tempDic;
}


-(NSString *)md5HashToLower32Bit{
    const char *input = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02x", result[i]];
    }
    
    return digest;
}


-(NSMutableAttributedString *)getFirstImageAttributedStringWithImage:(UIImage *)image withImageSize:(CGSize)imageSize withTopOffSet:(CGFloat)top{
    return [self inSertImageAttributedStringWithImages:@[image] withImageSizeValues:@[[NSValue valueWithCGSize:imageSize]] withTopOffSets:@[[NSNumber numberWithFloat:top]] withIndexs:@[[NSNumber numberWithInt:0]]];
}
-(NSMutableAttributedString *)inSertImageAttributedStringWithImages:(NSArray<UIImage *> *)images withImageSizeValues:(NSArray <NSValue *>*)imageSizeValues withTopOffSets:(NSArray <NSNumber *>*)tops withIndexs:(NSArray <NSNumber *>*)indexs{
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc]initWithString:self];
    for (int i = 0 ;i < images.count;i++) {
        UIImage *image = images[i];
        CGSize imageSize = [imageSizeValues[i] CGSizeValue];
        CGFloat top = [tops[i] floatValue];
        NSInteger index = [indexs[i] integerValue]+i;
        NSTextAttachment *attchment = [[NSTextAttachment alloc]init];
        attchment.bounds = CGRectMake(0, -top, imageSize.width, imageSize.height);//设置frame
        attchment.image = image;//设置图片
        NSAttributedString *imageString = [NSAttributedString attributedStringWithAttachment:attchment];
        if (![self isEqualToString:@""]) {
            [attStr insertAttributedString:imageString atIndex:index];
        }
    }
    return attStr;
}

+ (NSString *)jointWithStringBySpacePerFour:(NSString *)str
{
    NSString *getString = @"";
    
    int a = (int)str.length/4;
    int b = (int)str.length%4;
    int c = a;
    if (b>0)
    {
        c = a+1;
    }
    else
    {
        c = a;
    }
    for (int i = 0 ; i<c; i++)
    {
        NSString *string = @"";
        
        if (i == (c-1))
        {
            if (b>0)
            {
                string = [str substringWithRange:NSMakeRange(4*(c-1), b)];
            }
            else
            {
                string = [str substringWithRange:NSMakeRange(4*i, 4)];
            }
            
        }
        else
        {
            string = [str substringWithRange:NSMakeRange(4*i, 4)];
        }
        getString = [NSString stringWithFormat:@"%@ %@",getString,string];
    }
    return getString;
}

+ (NSString*)getResultStrBySeverStr:(NSString*)targetStr{
    NSString *dealStr = targetStr;
    if ([dealStr isKindOfClass:[NSString class]] && dealStr.length){
        dealStr = [targetStr copy];
    }else{
        dealStr = @"";
    }
    return dealStr;
}

- (BOOL)isAccordLoginPassWordRegular{
    
    if (!self || self.length == 0) {
        return NO;
    }
    
    NSRegularExpression *numberRegular = [NSRegularExpression regularExpressionWithPattern:@"^(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[!.,/%^&*_@#$]).{6,20}$" options:NSRegularExpressionCaseInsensitive error:nil];
    NSInteger count = [numberRegular numberOfMatchesInString:self options:NSMatchingReportProgress range:NSMakeRange(0, self.length)];
    if (count > 0) {
        return YES;
    }
    return NO;
}


+ (BOOL)validateIdentityCard:(NSString *)identityCard
{
     NSString *pattern = @"(^[0-9]{15}$)|([0-9]{17}([0-9]|X)$)";
     NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
     BOOL isMatch = [pred evaluateWithObject:identityCard];
     return isMatch;
}


@end
