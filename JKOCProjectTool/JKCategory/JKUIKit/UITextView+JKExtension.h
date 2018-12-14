//
//  UITextView+JKExtension.h
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/12.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
NS_ASSUME_NONNULL_BEGIN

@interface UITextView (JKExtension)<UITextViewDelegate>

/**  可限制输入的字符个数 依赖于：JKLimitInput
 
 [UITextField的对象 setValue:@10 forKey:@"limit"];
 
 */

#pragma mark 1.1、当前选中的字符串范围
/**
 当前选中的字符串范围

 @return NSRange范围
 */
- (NSRange)jk_selectedRange;

#pragma mark 1.2、选中所有文字
/**
 选中所有文字
 */
- (void)jk_selectAllText;

#pragma mark 1.3、选中指定范围的文字
/**
 选中指定范围的文字

 @param range NSRange范围
 */
- (void)jk_setSelectedRange:(NSRange)range;

#pragma mark 1.4、用于计算textview输入情况下的字符数，解决实现限制字符数时，计算不准的问题
//https://github.com/pclion/TextViewCalculateLength
/**
 用于计算textview输入情况下的字符数，解决实现限制字符数时，计算不准的问题

 @param text 文字
 @return 返回字符数
 */
- (NSInteger)jk_getInputLengthWithText:(NSString *)text;

#pragma mark 1.5、提示语属性 与 使用
/**
  UITextView 提示语
 */
@property (nonatomic, strong) UITextView *jk_placeHolderTextView;

/**
 提示语使用

 @param placeHolder 提示语文字
 */
- (void)jk_addPlaceHolder:(NSString *)placeHolder;

@end

NS_ASSUME_NONNULL_END
