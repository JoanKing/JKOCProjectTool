//
//  UIViewController+JKViewController.h
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/8.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (JKViewController)

#pragma mark 1、找到当前视图控制器
/** 找到当前视图控制器 */
+ (UIViewController *)jk_currentViewController;

#pragma mark 2、找到当前导航控制器
/** 找到当前导航控制器 */
+ (UINavigationController *)jk_currentNavigatonController;

#pragma mark 3、在当前视图控制器中添加子控制器，将子控制器的视图添加到 view 中

/**
 在当前视图控制器中添加子控制器，将子控制器的视图添加到 view 中

 @param childController 要添加的子控制器
 @param view 要添加到的视图
 */
- (void)jk_addChildController:(UIViewController *)childController intoView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
