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
- (UIImage *)jkImageScaleToSize:(CGSize)newSize;

@end

NS_ASSUME_NONNULL_END
