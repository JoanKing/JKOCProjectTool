//
//  UIImage+JKUIImageRedraw.h
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/5.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (JKUIImageRedraw)

#pragma mark 1、图片大小的重新绘制
/**
 图片大小的重新绘制

 @param newSize 新的图片宽高
 @return 返回新的 UIImage对象
 */
- (UIImage *)jk_ImageScaleToSize:(CGSize)newSize;

#pragma mark 2、创建指定大小、颜色的图片
/**
 创建指定大小、颜色的图片
 
 @param color 图片颜色
 @param size 图片大小
 @return 创建的图片
 */
+ (UIImage *)jk_imageWithColor:(UIColor *)color size:(CGSize)size;

#pragma mark 2、
/**
 创建纯色背景、文字居中的图片
 
 @param color 图片背景色
 @param size 图片大小
 @param attributeString 居中文字
 @return 创建的图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size text:(NSAttributedString *)attributeString;


/**
 裁剪圆形图片
 
 @param image 需要裁剪的图片
 @param inset 裁剪inset
 @return 裁剪后的图片
 */
+ (UIImage *)ellipseImage:(UIImage *)image withInset:(CGFloat)inset;


/**
 裁剪带边框的圆形图片
 
 @param image 需要裁剪的图片
 @param inset 裁剪inset
 @param width 边框宽度
 @param color 边框颜色
 @return 裁剪后的图片
 */
+ (UIImage *)ellipseImage: (UIImage *) image withInset:(CGFloat)inset withBorderWidth:(CGFloat)width withBorderColor:(UIColor*)color;

@end

NS_ASSUME_NONNULL_END
