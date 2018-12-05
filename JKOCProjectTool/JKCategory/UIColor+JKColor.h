//
//  UIColor+JKColor.h
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/5.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (JKColor)

#pragma mark 1、十六进制的颜色
/**
 十六进制的颜色

 @param hexString 十六进制颜色的字符串
 @return 返回 UIColor
 */
+ (UIColor *)jkColorWithHexString: (NSString *)hexString;


@end

NS_ASSUME_NONNULL_END
