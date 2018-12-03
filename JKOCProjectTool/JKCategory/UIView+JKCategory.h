//
//  UIView+JKCategory.h
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/1.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (JKCategory)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic) CGPoint origin;
@property (nonatomic, assign) CGSize size;

@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat right;


#pragma mark 判断一个view是否在window上面
-(BOOL)isShowingOnWindow;

#pragma mark 给继承于UIView类增加切圆角
/**
 给继承于UIView类增加切圆角

 @param corners 添加圆角的位置
 @param value 圆角的大小
 */
-(void)jkCutRoundRectCorner:(UIRectCorner)corners withCornerRadius:(CGFloat)value;

@end

NS_ASSUME_NONNULL_END
