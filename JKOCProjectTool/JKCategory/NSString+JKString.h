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
+ (NSString *)floatToString:(CGFloat)f;


@end

NS_ASSUME_NONNULL_END
