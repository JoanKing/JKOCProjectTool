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

#pragma mark 1、旋转 360°
/**
 旋转 360° ： 无线转圈、2秒转一圈
 */
- (void)jk_rotate360DegreeWithImageView;

#pragma mark 2、自定义旋转 360
/**
 自定义旋转 360

 @param repeat_count 重复的次数
 @param duration 多长时间旋转一圈
 */
-(void)jk_rotate360DegreeWithImageViewRepeatCount:(float)repeat_count withDuration:(CFTimeInterval)duration;

#pragma mark 3、暂停旋转
/**
 暂停旋转
 */
- (void)jk_stopRotate;

@end

NS_ASSUME_NONNULL_END
