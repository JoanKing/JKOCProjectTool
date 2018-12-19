//
//  NSString+JKContains.h
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/11.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (JKContains)

#pragma mark 1、判断URL中是否包含中文
/**
 判断URL中是否包含中文

 @return 是否包含中文
 */
- (BOOL)isContainChinese;
#pragma mark 2、是否包含空格
/**
 是否包含空格

 @return 是否包含空格
 */
- (BOOL)isContainBlank;

#pragma mark 3、Unicode编码的字符串转成NSString
/**
 Unicode编码的字符串转成NSString

 @return Unicode编码的字符串转成NSString
 */
- (NSString *)makeUnicodeToString;

#pragma mark 4、判断是否包含字符
/**
 判断是否包含字符集合

 @param set 字符集合
 @return 返回YES/NO
 */
- (BOOL)containsCharacterSet:(NSCharacterSet *)set;

#pragma mark 5、是否包含字符串
/**
 是否包含字符串

 @param string 字符串
 @return YES:包含;NO:不包含
 */
- (BOOL)containsaString:(NSString *)string;

#pragma mark 6、获取字符数量
/**
 获取字符数量

 @return 返回 获取字符数量
 */
- (int)wordsCount;

#pragma mark 7、判断字符串是否有空格
/**
 判断字符串是否有空格

 @param str 字符串
 @return 返回一个BOOL值
 */
+(BOOL)jk_stringIsEmpty:(NSString *)str;

#pragma mark 8、是否仅中文,英文,数字
/**
 是否仅中文,英文,数字

 @param string 字符串
 @return 返回一个BOOL值
 */
+ (BOOL)jk_stringChineseNumEnglish:(NSString *)string;

#pragma mark 9、判断中英混合的的字符串长度
/**
 判断中英混合的的字符串长度

 @param strtemp 字符串
 @return 中英混合的的字符串长度
 */
+(int)jk_stringConvertToInt:(NSString*)strtemp;

@end

NS_ASSUME_NONNULL_END
