//
//  NSString+JKString.h
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/6.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (JKString)


#pragma mark 1、格式化输出 根据有无小数点转换成对相应string(最多两位小数点)

/**
 格式化输出 根据有无小数点转换成对相应string(最多两位小数点)

 @param f 小数的位数
 @return 返回一个字符串
 */
+ (NSString *)jk_floatToString:(CGFloat)f;

#pragma mark 2、清除html标签

/**
 清除html标签

 @return 清除后的结果
 */
- (NSString *)jk_stringByStrippingHTML;

#pragma mark 3、清除js脚本

/**
 清除js脚本

 @return 清楚js后的结果
 */
- (NSString *)jk_stringByRemovingScriptsAndStrippingHTML;

#pragma mark 4、去除空格

/**
 去除空格

 @return 去除空格后的字符串
 */
- (NSString *)jk_trimmingWhitespace;

#pragma mark 5、去除字符串与空行

/**
 去除字符串与空行

 @return 去除字符串与空行的字符串
 */
- (NSString *)jk_trimmingWhitespaceAndNewlines;

@end

NS_ASSUME_NONNULL_END
