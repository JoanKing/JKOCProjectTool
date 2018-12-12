//
//  UIImage+JKColorImage.h
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/12.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (JKColorImage)

#pragma mark 0、根据颜色生成纯色图片
/**
 根据颜色生成纯色图片

 @param color 颜色
 @return 纯色图片
 */
+ (UIImage *)jk_imageWithColor:(UIColor *)color;

#pragma mark 1、创建指定大小、颜色的图片
/**
 创建指定大小、颜色的图片
 
 @param color 图片颜色
 @param size 图片大小
 @return 创建的图片
 */
+ (UIImage *)jk_imageWithColor:(UIColor *)color size:(CGSize)size;

#pragma mark 2、创建纯色背景、文字居中的图片
/**
 创建纯色背景、文字居中的图片
 
 @param color 图片背景色
 @param size 图片大小
 @param attributeString 居中文字
 @return 创建的图片
 举例：
 NSAttributedString *attributedString = [[NSAttributedString alloc]initWithString:@"hello world" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:30.f],NSForegroundColorAttributeName:[UIColor brownColor]}];
 */
+ (UIImage *)jk_imageWithColor:(UIColor *)color size:(CGSize)size text:(NSAttributedString *)attributeString;

#pragma mark 3、需要裁剪的图片
/**
 裁剪圆形图片
 
 @param image 需要裁剪的图片
 @param inset 裁剪inset
 @return 裁剪后的图片
 */
+ (UIImage *)jk_ellipseImage:(UIImage *)image withInset:(CGFloat)inset;

#pragma mark 4、裁剪带边框的圆形图片
/**
 裁剪带边框的圆形图片
 
 @param image 需要裁剪的图片
 @param inset 裁剪inset
 @param width 边框宽度
 @param color 边框颜色
 @return 裁剪后的图片
 */
+ (UIImage *)jk_ellipseImage:(UIImage *) image withInset:(CGFloat)inset withBorderWidth:(CGFloat)width withBorderColor:(UIColor*)color;

#pragma mark 5、取图片某一点的颜色
/**
 取图片某一点的颜色

 @param point  某一点
 @return 颜色
 */
- (UIColor *)jk_colorAtPoint:(CGPoint )point;

#pragma mark 6、取某一像素的颜色
/**
 取某一像素的颜色

 @param point 某一像素的颜色
 @return 颜色
 */
- (UIColor *)jk_colorAtPixel:(CGPoint)point;

@end

NS_ASSUME_NONNULL_END
