//
//  UIImageView+JKImageView.h
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/7.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (JKImageView)

#pragma mark 1、快速创建imageView
/**
 快速创建imageView

 @param imageName 图片的名字
 @param frame 图片的尺寸
 @return 返回自身的对象
 */
+(instancetype)jk_createimageViewWithImageName:(NSString *)imageName frame:(CGRect)frame;


#pragma mark 2、旋转 360°
/**
 旋转 360° ： 无线转圈、2秒转一圈
 */
- (void)jk_rotate360DegreeWithImageView;

#pragma mark 3、自定义旋转 360
/**
 自定义旋转 360

 @param repeat_count 重复的次数
 @param duration 多长时间旋转一圈
 */
-(void)jk_rotate360DegreeWithImageViewRepeatCount:(float)repeat_count withDuration:(CFTimeInterval)duration;

#pragma mark 4、暂停旋转
/**
 暂停旋转
 */
- (void)jk_stopRotate;

#pragma mark 5、倒影
/**
   倒影
 */
- (void)jk_reflect;


@end

NS_ASSUME_NONNULL_END
