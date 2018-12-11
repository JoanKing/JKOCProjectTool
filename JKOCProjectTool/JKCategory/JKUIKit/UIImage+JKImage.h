//
//  UIImage+JKUIImageRedraw.h
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/5.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
 
@interface UIImage (JKImage)

#pragma mark 1、将图片大小压缩到指定比例
/**
 将图片大小压缩到指定比例

 @param newSize 新的图片宽高
 @return 返回新的 UIImage对象
 */
- (UIImage *)jk_imageScaleToSureSize:(CGSize)newSize;

#pragma mark 2、进行图像尺寸的压缩(也就是设置一个宽高，按比例缩小图片，仅仅是尺寸的缩小)
/**
 进行图像尺寸的压缩

 @param newSize 新的图片大小
 @return 返回一个新的图片
 */
-(UIImage *)jk_imageZoomSize:(CGSize)newSize;

#pragma mark 3、按照宽高在中间截取图片
/**
 按照宽高在中间截取图片： 宽与高谁小谁就是就是截取的尺寸，以原图的中心为准
 @return 返回截取后的图片
 */
-(UIImage *)jk_imageScale;

#pragma mark 4、比例压缩图片后，按照宽与高谁小以谁的尺寸截取正方形图片
/**
 截取中间部分:比例压缩图片后，按照宽与高谁小以谁的尺寸截取正方形图片

 @param newSize 图片的最大尺寸
 @return 返回截取后的图片
 */
-(UIImage *)jk_imageZoomScaledToSize:(CGSize)newSize;

#pragma mark 5、从图片中按指定的位置大小截取图片的一部分
// 解释：ios可以自动识别@2x 和@3x的图片，以适应在不同屏幕上显示的图片大小一致，这里截取的图片是按像素在原图上截取，原图大小和屏幕上显示的大小未必一致，所以要进行相应的转化，缩放比就是[UIScreen mainScreen].scale，不同屏幕的scale是不同的
/**
 从图片中按指定的位置大小截取图片的一部分
 
 @param rect 要截取的区域
 @return 返回剪切后的图片
 */
-(UIImage *)jk_scaleImageFromInRect:(CGRect)rect;



#pragma mark 4、创建指定大小、颜色的图片
/**
 创建指定大小、颜色的图片
 
 @param color 图片颜色
 @param size 图片大小
 @return 创建的图片
 */
+ (UIImage *)jk_imageWithColor:(UIColor *)color size:(CGSize)size;

#pragma mark 5、
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
