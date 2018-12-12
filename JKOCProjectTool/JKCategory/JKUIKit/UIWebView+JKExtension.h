//
//  UIWebView+JKExtension.h
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/12.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIWebView (JKExtension)

#pragma mark - 1、获取网页中的数据

#pragma mark 1.1、获取某个标签的结点个数
/**
 获取某个标签的结点个数

 @param tag 节点字符串
 @return 返回节点数
 */
- (int)nodeCountOfTag:(NSString *)tag;

#pragma mark 1.2、获取当前页面URL
/**
 获取当前页面URL

 @return 返回当前页面URL
 */
- (NSString *) getCurrentURL;

#pragma mark 1.3、网页的标题
/**
 获取网页的标题

 @return 返回 网页的标题
 */
- (NSString *) getTitle;

#pragma mark 1.4、获取网页中的图片数组
/**
 获取网页中的图片数组

 @return 返回 网页中的图片数组
 */
- (NSArray *) getImgs;

#pragma mark 1.5、获取当前页面所有链接
- (NSArray *) getOnClicks;

#pragma mark - 2、改变网页样式和行为

#pragma mark 2.1、改变网页背景颜色
/**
 改变网页背景颜色

 @param color 网页背景颜色
 */
- (void) setBackgroundColor:(UIColor *)color;

#pragma mark 2.2、为所有图片添加点击事件(网页中有些图片添加无效)
/**
 为所有图片添加点击事件(网页中有些图片添加无效)
 */
- (void) addClickEventOnImg;

#pragma mark 2.3、改变所有图像的宽度
/**
 改变所有图像的宽度

 @param size 宽度
 */
- (void) setImgWidth:(int)size;

#pragma mark 2.4、改变所有图像的高度
/**
 改变所有图像的高度

 @param size 高度
 */
- (void) setImgHeight:(int)size;

#pragma mark 2.5、改变指定标签的字体颜色
/**
 改变指定标签的字体颜色

 @param color 字体颜色
 @param tagName 字体的名字
 */
- (void) setFontColor:(UIColor *) color withTag:(NSString *)tagName;

#pragma mark 2.6、改变指定标签的字体大小

/**
 改变指定标签的字体大小

 @param size 字体大小
 @param tagName 要改变的名字
 */
- (void)setFontSize:(int) size withTag:(NSString *)tagName;


#pragma mark - 3、获取网页meta信息
// 原地址： https://github.com/tatyusa/UIWebView-MetaParser
/**
 获取网页meta信息

 @return 返回一个信息数组
 */
-(NSArray *)jk_getMetaData;

#pragma mark - 4、网页的Style

#pragma mark 4.1、是否显示阴影
/**
 是否显示阴影

 @param b 是否显示阴影
 */
- (void)setShadowViewHidden:(BOOL)b;

#pragma mark 4.2、是否显示水平滑动指示器
/**
 是否显示水平滑动指示器

 @param b 是否显示水平滑动指示器
 */
- (void)setShowsHorizontalScrollIndicator:(BOOL)b;

#pragma mark 4.3、是否显示垂直滑动指示器
/**
 是否显示垂直滑动指示器

 @param b 是否显示垂直滑动指示器
 */
- (void)setShowsVerticalScrollIndicator:(BOOL)b;

#pragma mark 4.4、网页透明
/**
 网页透明
 */
-(void) makeTransparent;

#pragma mark 4.5、网页透明移除+阴影
/**
 网页透明移除+阴影
 */
-(void) makeTransparentAndRemoveShadow;


#pragma mark - 5、webview的其他操作

#pragma mark 5.1、读取bundle中的webview
/**
 读取bundle中的webview

 @param htmlName webview名称
 */
- (void)jk_loadLocalHtml:(NSString*)htmlName;

#pragma mark 5.2、清空cookie
/**
 清空cookie
 */
- (void)jk_clearCookies;

@end

NS_ASSUME_NONNULL_END
