//
//  UIWindow+JKHierarchy.h
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/12.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIWindow (JKHierarchy)

#pragma mark 1、最顶端的控制器
/**
 最顶端的控制器 topMostController

 @return the current Top Most ViewController in hierarchy.
 */
-(UIViewController*)jk_topMostController;

#pragma mark 2、当前控制器 currentViewController
/**
  当前控制器 currentViewController

 @return the topVie
 */
-(UIViewController*)jk_currentViewController;

@end

NS_ASSUME_NONNULL_END
