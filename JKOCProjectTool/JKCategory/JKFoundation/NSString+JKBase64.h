//
//  NSString+JKBase64.h
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/11.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (JKBase64)

#pragma mark 1、下面是有关 Base64 的字符串

/**
 原理：1> ASCII码是8个二进制位一编码
 2> Base64编码是6个二进制位一编码,所以转换成字符串后会比ASCII内容要多
 
 */

// base64 编码
- (NSString *)jk_encodedbase64String;
// base64 解码
- (NSString *)jk_decodedbase64String;

// base64 编码
+(NSString *)jk_encodedbase64String:(NSString *)encodedString;
// base64 解码
+(NSString *)jk_decodedbase64String:(NSString *)decodedString;

// 根据NSData生成Base64编码的String
+ (NSString*)encodeBase64Data:(NSData *)data;
// NSData生成未编码的NSString
+ (NSString*)decodeBase64Data:(NSData *)data;


@end

NS_ASSUME_NONNULL_END
