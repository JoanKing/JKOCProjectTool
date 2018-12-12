//
//  UITextField+JKTextField.h
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/11.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (JKTextField)

/**  可限制输入的字符个数 依赖于：JKLimitInput
 
   [UITextField的对象 setValue:@10 forKey:@"limit"];
 
 */

#pragma mark 1、UITextField 的 placeholder 设置颜色
/**
   给 UITextField 的 textFiled.placeholder = @"请输入手机号";

 @param color 设置颜色
 */
-(void)jk_placeHolderColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
