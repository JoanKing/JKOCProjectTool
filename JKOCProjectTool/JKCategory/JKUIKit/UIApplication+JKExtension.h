//
//  UIApplication+JKExtension.h
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/12.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIApplication (JKExtension)

#pragma mark  键盘的frame
/**
 键盘的frame

 @return  键盘的frame
 */
+(CGRect)keyboardFrame;

@end

NS_ASSUME_NONNULL_END
