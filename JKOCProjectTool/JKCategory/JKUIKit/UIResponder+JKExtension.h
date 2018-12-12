//
//  UIResponder+JKExtension.h
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/12.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIResponder (JKExtension)

#pragma mark 1、响应者链
/**
 响应者链

 @return 响应者链
 */
- (NSString *)responderChainDescription;

#pragma mark 2、当前第一响应者
/**
 当前第一响应者

 @return 当前第一响应者
 */
+ (id)jk_currentFirstResponder;

@end

NS_ASSUME_NONNULL_END
