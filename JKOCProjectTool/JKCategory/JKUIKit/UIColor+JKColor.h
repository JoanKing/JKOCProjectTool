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

#pragma mark 1、随机色
/**
 随机色

 @return 返回 UIColor
 */
+(UIColor *)jk_randomColor;

#pragma mark 1、十六进制的颜色
/**
 十六进制的颜色

 @param hexString 十六进制颜色的字符串
 @return 返回 UIColor
 */
+ (UIColor *)jk_colorWithHexString: (NSString *)hexString;

/**
 *  @brief  获取canvas用的颜色字符串
 *
 *  @return canvas颜色
 */
- (NSString *)canvasColorString;
/**
 *  @brief  获取网页颜色字串
 *
 *  @return 网页颜色
 */
- (NSString *)webColorString;

@end

NS_ASSUME_NONNULL_END
