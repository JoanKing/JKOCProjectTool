//
//  UIImage+JKDirection.h
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/12.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (JKDirection)

#pragma mark 1、修正图片的方向
/**
 修正图片的方向

 @param srcImg 图片
 @return 修正方向后的图片
 */
+ (UIImage *)jk_fixDirection:(UIImage *)srcImg;

#pragma mark 2、角度 旋转图片
/**
 旋转图片

 @param degrees 角度
 @return 旋转后图片
 */
- (UIImage *)jk_imageRotatedByDegrees:(CGFloat)degrees;

#pragma mark 3、弧度 旋转图片
/**
 旋转图片

 @param radians 弧度
 @return 旋转后图片
 */
- (UIImage *)jk_imageRotatedByRadians:(CGFloat)radians;

#pragma mark 4、垂直翻转
/**
 垂直翻转

 @return 翻转后的图片
 */
- (UIImage *)jk_flipVertical;

#pragma mark 5、水平翻转
/**
 水平翻转

 @return 翻转后的图片
 */
- (UIImage *)jk_flipHorizontal;

#pragma mark 6、角度转弧度
/**
 角度转弧度

 @param degrees 角度
 @return 弧度
 */
+(CGFloat)jk_degreesToRadians:(CGFloat)degrees;

#pragma mark 7、弧度转角度
/**
 弧度转角度

 @param radians 弧度
 @return 角度
 */
+(CGFloat)jk_radiansToDegrees:(CGFloat)radians;


@end

NS_ASSUME_NONNULL_END
