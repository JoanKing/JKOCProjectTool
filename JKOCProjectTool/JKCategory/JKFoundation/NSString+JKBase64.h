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
+ (NSString *)jk_stringWithBase64EncodedString:(NSString *)string;
- (NSString *)jk_base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth;
- (NSString *)jk_base64EncodedString;
- (NSString *)jk_base64DecodedString;
- (NSData *)jk_base64DecodedData;


@end

NS_ASSUME_NONNULL_END
