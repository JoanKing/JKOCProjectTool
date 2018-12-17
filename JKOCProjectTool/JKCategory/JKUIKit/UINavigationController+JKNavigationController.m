//
//  UINavigationController+JKNavigationController.m
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/8.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import "UINavigationController+JKNavigationController.h"

@implementation UINavigationController (JKNavigationController)

- (id)jk_findViewController:(Class)className;
{
    for (UIViewController *viewController in self.viewControllers)
    {
        if ([viewController isKindOfClass:className])
        {
            return viewController;
        }
    }
    
    return nil;
}

- (BOOL)jk_isOnlyContainRootViewController
{
    if (self.viewControllers && self.viewControllers.count == 1)
    {
        return YES;
    }
    return NO;
}

- (UIViewController *)jk_rootViewController
{
    if (self.viewControllers && [self.viewControllers count] >0)
    {
        return [self.viewControllers firstObject];
    }
    return nil;
}

- (void)jk_popToViewControllerWithClassName:(Class)className animated:(BOOL)animated;
{
     [self popToViewController:[self jk_findViewController:className] animated:YES];
}

- (void)jk_popToViewControllerWithLevel:(NSInteger)level animated:(BOOL)animated
{
    NSInteger viewControllersCount = self.viewControllers.count;
    if (viewControllersCount > level) {
        NSInteger idx = viewControllersCount - level - 1;
        UIViewController *viewController = self.viewControllers[idx];
        [self popToViewController:viewController animated:animated];
    } else {
        [self popToRootViewControllerAnimated:animated];
    }
}


- (void)jk_pushViewController:(UIViewController *)controller withTransition:(UIViewAnimationTransition)transition {
    [UIView beginAnimations:nil context:NULL];
    [self pushViewController:controller animated:NO];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationTransition:transition forView:self.view cache:YES];
    [UIView commitAnimations];
}

- (void)jk_popViewControllerWithTransition:(UIViewAnimationTransition)transition {
    [UIView beginAnimations:nil context:NULL];
    [self popViewControllerAnimated:NO];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationTransition:transition forView:self.view cache:YES];
    [UIView commitAnimations];
}

- (UINavigationController*)jk_currentNavigationController
{
    UINavigationController* nav = nil;
    if ([self isKindOfClass:[UINavigationController class]]) {
        nav = (id)self;
    }
    else {
        if ([self isKindOfClass:[UITabBarController class]]) {
            nav = [((UITabBarController*)self).selectedViewController jk_currentNavigationController];
        }
        else {
            nav = self.navigationController;
        }
    }
    return nav;
}

@end
