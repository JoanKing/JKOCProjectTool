//
//  UILabel+JKLabel.h
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/8.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (JKLabel)

#pragma mark 1、设置字间距

/**
 设置字间距

 @param columnSpace 字间距大小
 */
- (void)jk_setColumnSpace:(CGFloat)columnSpace;

#pragma mark 2、设置行距

/**
 设置行距

 @param rowSpace 行距的大小
 */
- (void)jk_setRowSpace:(CGFloat)rowSpace;


@end

NS_ASSUME_NONNULL_END
