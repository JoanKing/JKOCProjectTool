//
//  UINavigationController+JKNavigationController.h
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/8.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (JKNavigationController)

#pragma mark 1、寻找Navigation中的某个viewcontroler
/**
 寻找Navigation中的某个viewcontroler

 @param className 类对象
 @return 返回一个实例对象
 */
- (id)jk_findViewController:(Class)className;


#pragma mark 2、判断是否只有一个RootViewController
/**
 判断是否只有一个RootViewController

 @return 返回BOOL值
 */
- (BOOL)jk_isOnlyContainRootViewController;

/** RootViewController */

#pragma mark 3、设置为导航控制器
/**
 设置为导航控制器

 @return 返回自身
 */
- (UIViewController *)jk_rootViewController;

#pragma mark 4、返回指定的viewcontroler
/**
 返回指定的控制器

 @param className 类对象
 @param animated 动画
 */
- (void)jk_popToViewControllerWithClassName:(Class)className animated:(BOOL)animated;

#pragma mark 5、pop回第n层
/**
 pop回第n层

 @param level 第n层
 @param animated 动画
 */
- (void)jk_popToViewControllerWithLevel:(NSInteger)level animated:(BOOL)animated;

#pragma mark 6、以某种动画形式push
/**
 以某种动画形式push

 @param controller 要进入的控制器
 @param transition 某种动画形式
 */
- (void)jk_pushViewController:(UIViewController *)controller withTransition:(UIViewAnimationTransition)transition;

#pragma mark 7、以某种动画形式pop

/**
 以某种动画形式pop

 @param transition 某种动画形式
 */
- (void)jk_popViewControllerWithTransition:(UIViewAnimationTransition)transition;

#pragma mark 8、返回当前vc的 navigationController
/**
 返回当前vc的 navigationController

 @return 返回当前vc的导航控制器
 */
- (UINavigationController*)jk_currentNavigationController;

@end

NS_ASSUME_NONNULL_END
