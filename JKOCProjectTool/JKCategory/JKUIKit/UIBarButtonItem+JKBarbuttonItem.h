//
//  UIBarButtonItem+JKBarbuttonItem.h
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/5.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (JKBarbuttonItem)

#pragma mark 1、根据图片创建一个item 点击item之后调用的方法
/**
 创建一个item   点击item之后调用的方法

 @param target 调用对象，一般是self
 @param image 图片（正常）
 @param action 方法调用
 @return 创建完的item
 */
+(UIBarButtonItem *)jk_itemWithTarget:(id)target Image:(NSString *)image action:(SEL)action;

#pragma mark 2、用作修正位置的UIBarButtonItem
/**
 用作修正位置的UIBarButtonItem
 
 @param width 修正宽度
 @return 修正位置的UIBarButtonItem
 */
+(UIBarButtonItem *)jk_itemFixedSpaceWithWidth:(CGFloat)width;


@end

NS_ASSUME_NONNULL_END
