//
//  JKTextExtension.h
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/5.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface JKTextExtension : NSObject

#pragma mark 1、计算一个文本的高度
/**
 计算一个文本的高度

 @param textContent 文本的内容
 @param textfont 字体的大小
 @param maxSize 文本的最大宽高
 @return 返回文本高度
 */
+(CGFloat)jk_heightTextContent:(NSString *)textContent withSizeFont:(CGFloat)textfont withMaxSize:(CGSize)maxSize;

#pragma mark 2、计算一个文本的宽度
/**
 计算一个文本的宽度

 @param textContent 文本的内容
 @param textfont 字体的大小
 @param maxSize 文本的最大宽高
 @return 返回文本高度
 */
+(CGFloat)jk_widthTextContent:(NSString *)textContent withTextfont:(CGFloat)textfont withMaxSize:(CGSize)maxSize;

#pragma mark 3、计算一个文本的Size
/**
 计算一个文本的Size

 @param textContent 文本的内容
 @param textfont 字体的大小
 @param maxSize 文本的最大宽高
 @return 返回文本的 Size
 */
+(CGSize)jk_sizeTextContent:(NSString *)textContent withSizeFont:(CGFloat)textfont withMaxSize:(CGSize)maxSize;

#pragma mark 4、富文本的Size
/**
 富文本计算的Size

 @param attributedText 富文本的内容
 @param maxSize 富文本的最大宽高
 @return 返回富文本的size
 */
+(CGSize)jk_sizeAttributedTextContentToFit:(NSMutableAttributedString *)attributedText withMaxSize:(CGSize)maxSize;

#pragma mark 5、移除字符串头部和尾部的空格

/**
 移除字符串头部和尾部的空格

 @param string 字符串内容
 @return 返回 移除字符串头部和尾部的空格 的字符串
 */
+(NSString *)jk_removeStringHeadAndFootSpace:(NSString *)string;

#pragma mark 6、移除字符串头部和尾部的空格以及换行符
/**
 移除字符串头部和尾部的空格以及换行符

 @param string 字符串内容
 @return 返回去除 首尾空格 后的字符串
 */
+(NSString *)jk_removeStringHeadAndFootSpaceAndWrap:(NSString *)string;

#pragma mark  7、去除所有的空格与换行
/**
 去除所有的空格与换行
 
 @param string 字符串内容
 @return 返回 去除所有的空格与换行 后的字符串
 */
+(NSString *)jk_removeStringAllSpaceAndWrap:(NSString *)string;

#pragma mark 8、单纯改变一句话中的某些字的颜色（一种颜色）
/**
 单纯改变一句话中的某些字的颜色（一种颜色）

 @param color 需要改变成的颜色
 @param totalStr 总的字符串
 @param subArray 需要改变颜色的文字数组(要是有相同的 只取第一个)
 @return 生成的富文本
 */
+ (NSMutableAttributedString *)jk_changeCorlorWithColor:(UIColor *)color TotalString:(NSString *)totalStr SubStringArray:(NSArray *)subArray;

@end

NS_ASSUME_NONNULL_END
