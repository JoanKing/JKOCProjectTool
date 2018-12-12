//
//  UIButton+JKExtension.h
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/12.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^JKTouchedBlock)(NSInteger tag);

typedef NS_ENUM(NSInteger, LXMImagePosition) {
    LXMImagePositionLeft = 0,              //图片在左，文字在右，默认
    LXMImagePositionRight = 1,             //图片在右，文字在左
    LXMImagePositionTop = 2,               //图片在上，文字在下
    LXMImagePositionBottom = 3,            //图片在下，文字在上
};

@interface UIButton (JKExtension)

#pragma mark 1、设置按钮额外热区
/**
 设置按钮额外热区
 
 注意：UIEdgeInsetsMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right) 是向四周扩展的
 原地址：https://github.com/devxoul/UIButton-TouchAreaInsets
 */
@property (nonatomic, assign) UIEdgeInsets jk_touchAreaInsets;

#pragma mark 2、Button上图片与文字的设置
/**
 Button上图片与文字的设置

 @param postion 图片与文字的设置
 @param spacing 图片与文字的间距
 
 利用UIButton的titleEdgeInsets和imageEdgeInsets来实现文字和图片的自由排列
 注意：这个方法需要在设置图片和文字之后才可以调用，且button的大小要大于 图片大小+文字大小+spacing
 原地址：https://github.com/Phelthas/Demo_ButtonImageTitleEdgeInsets
 */
- (void)setImagePosition:(LXMImagePosition)postion spacing:(CGFloat)spacing;

#pragma mark 3、button添加转圈提示
/**
 给button添加转圈提示
 */
- (void) showIndicator;
/**
 移除button上的转圈提示
 */
- (void) hideIndicator;

#pragma mark 4、给button添加Block方法
/**
 给button添加Block方法

 @param touchHandler block方法
 */
-(void)jk_addActionHandler:(JKTouchedBlock)touchHandler;

@end

NS_ASSUME_NONNULL_END
