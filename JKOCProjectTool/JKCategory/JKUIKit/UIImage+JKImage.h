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

#pragma mark 1、获得指定size的图片
/**
  获得指定size的图片

 @param newSize 新的图片宽高
 @return 返回新的 UIImage对象
 */
- (UIImage *)jk_imageScaleToSureSize:(CGSize)newSize;

#pragma mark 2、进行图像尺寸的压缩(通过指定图片最长边，获得等比例的图片size)
/**
 通过指定图片最长边，获得等比例的图片size

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

#pragma mark 6、图片的局部拉伸：比如聊天的泡泡保持一部分不拉伸，也可用xcode里面点开图片设置
// 然后中间的１像素用于中间的平铺，达到最后所需要的尺寸。效果相当于只能保持左边和上面固定，拉伸下面和右边。
/**
 图片的局部拉伸

 @param leftCapWidth 左边不拉伸的像素
 @param topCapHeight 上边不拉伸的像素
 @return 返回处理过的 UIImage
 */
-(UIImage *)jk_setImageWithStretchableImageLeftCapWidth:(NSInteger)leftCapWidth withTopCapHeight:(NSInteger)topCapHeight;

#pragma mark 7、背景图片右下角添加水印图片
/**
 背景图片右下角添加水印图片

 @param bgImage 背景图片的名字
 @param markName 水印图片的名字
 @return 合成的图片
 */
+(UIImage *)jk_waterMarkImageWithBackImage:(UIImage *)bgImage andMarkImageName:(NSString *)markName;

#pragma mark 8、给图片添加图片水印
/**
 给图片添加图片水印

 @param bg_image 背景图片
 @param waterImage 水印图片
 @param rect 添加水印的 rect
 @return 返回一个合成后的图片
 */
+ (UIImage *)jx_waterMarkImageWithBackgroundImage:(UIImage *)bg_image waterImage:(UIImage *)waterImage waterImageRect:(CGRect)rect;

#pragma mark 9、给图片添加文字水印

/**
 给图片添加文字水印

 @param image 底图
 @param text 文字
 @param point 起点
 @param attributed 属性：
   NSDictionary * firstAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:12],NSForegroundColorAttributeName:[UIColor redColor]}
 @return 返回合成后的图片
 */
+(UIImage *)jx_waterImageWithImage:(UIImage *)image text:(NSString *)text textPoint:(CGPoint)point attributedString:(NSDictionary *)attributed;

#pragma mark 10、合并两个图片
/**
 合并两个图片

 @param firstImage 一个图片
 @param secondImage 二个图片
 @return return 合并后图片
 */
+ (UIImage*)jk_mergeImage:(UIImage*)firstImage withImage:(UIImage*)secondImage;




@end

NS_ASSUME_NONNULL_END
