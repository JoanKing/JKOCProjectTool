//
//  CALayer+JKLayer.h
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/8.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface CALayer (JKLayer)

#pragma mark 1、左右抖动

/** 左右抖动 */
-(void)jk_shake;

@end

NS_ASSUME_NONNULL_END
