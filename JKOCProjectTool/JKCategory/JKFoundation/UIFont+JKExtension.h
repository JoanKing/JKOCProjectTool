//
//  UIFont+JKExtension.h
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/12.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIFont (JKExtension)

/**
 *  作者 terry-au
 *  地址 https://github.com/nin9tyfour/UIFont-TTF
 */


#pragma mark 1、从路径加载字体
/*  使用举例：
 NSString *pathToFont = [[NSBundle mainBundle] pathForResource:@"segoeui" ofType:@"ttf"];
 UIFont *smallFontFromPath = [UIFont fontWithTTFAtPath:pathToFont size:18.0f];
 */
/**
 从路径加载字体

 @param path 本地字体路径
 @param size 字体的大小
 @return 返回一个UIFont
 */
+ (UIFont *)fontWithTTFAtPath:(NSString *)path size:(CGFloat)size;

#pragma mark 2、从本地文件URL 加载字体
/*  使用举例：
    NSString *pathToFont = [[NSBundle mainBundle] pathForResource:@"segoeui" ofType:@"ttf"];
 
    NSURL *URLToFont = [NSURL fileURLWithPath:pathToFont];
    UIFont *smallFontFromURL = [UIFont fontWithTTFAtURL:[NSURL fileURLWithPath:pathToFont] size:18.0f];
 */
/**
 从本地文件URL 加载字体

 @param URL 本地资源路径加载url
 @param size 字体的大小
 @return 返回一个UIFont
 */
+ (UIFont *)fontWithTTFAtURL:(NSURL *)URL size:(CGFloat)size;


@end

NS_ASSUME_NONNULL_END
