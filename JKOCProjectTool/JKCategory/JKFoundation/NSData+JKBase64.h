//
//  NSData+JKBase64.h
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/11.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (JKBase64)

#pragma mark 1、字符串base64后转data
/**
 字符串base64后转data

 @param string 传入字符串
 @return 传入字符串 base64后的data
 */
+ (NSData *)jk_dataWithBase64EncodedString:(NSString *)string;

#pragma mark 2、NSData转string
/**
 NSData转string

 @param wrapWidth wrapWidth 换行长度  76  64
 @return base64后的字符串
 */
- (NSString *)jk_base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth;

#pragma mark 3、NSData转string 换行长度默认64
/**
 NSData转string 换行长度默认64

 @return base64后的字符串
 */
- (NSString *)jk_base64EncodedString;

@end

NS_ASSUME_NONNULL_END
