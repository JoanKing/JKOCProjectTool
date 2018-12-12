//
//  UIImage+JKGIF.h
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/12.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (JKGIF)

#pragma mark 1、本地加载gif图片
/**
 本地加载gif图片

 @param name gif图片的名字
 @return 返回一个gif图片的UIImagex对象
 */
+ (UIImage *)jk_animatedGIFNamed:(NSString *)name;

#pragma mark 2、加载 Data 类型的gif图片
/**
 加载 Data 类型的gif图片

 @param data gif图片的Data
 @return 返回一个gif图片的UIImagex对象
 */
+ (UIImage *)jk_animatedGIFWithData:(NSData *)data;

#pragma mark 3、图片进行缩放剪切
/**
 图片进行缩放剪切

 @param size 将来的图片尺寸大小
 @return 返回一个图片
 */
- (UIImage *)jk_animatedImageByScalingAndCroppingToSize:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
