//
//  UIView+JKCategory.m
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/1.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import "UIView+JKCategory.h"

@implementation UIView (JKCategory)

#pragma mark x
- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

#pragma mark y
- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

#pragma mark width
- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

#pragma mark height
- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

#pragma mark size
- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

#pragma mark centerX
- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

#pragma mark centerY
- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

#pragma mark origin
- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

#pragma mark 上
- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

#pragma mark 左
- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

#pragma mark 下
- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

#pragma mark 右
- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

#pragma mark 判断一个view是否在主窗口上
-(BOOL)isShowingOnWindow{
    
    UIWindow *keywindow = [UIApplication sharedApplication].keyWindow;
    
    
    //nil = [UIApplication sharedApplication].keyWindow
    //转换坐标系
    CGRect newFrame = [self.superview convertRect:self.frame toView:keywindow];
    
    //CGRect newFrame = [[UIApplication sharedApplication].keyWindow convertRect:subview.frame fromView:subview.superview];
    
    CGRect windowBouns = keywindow.bounds;
    
    BOOL intersects =  CGRectIntersectsRect(newFrame, windowBouns);
    
    //判断一个控件是否真正显示在窗口范围内
    
    return !self.isHidden && self.alpha > 0.01 && intersects && self.window == keywindow;
    
}

/**
 给继承于UIView类增加切圆角
 
 @param corners 添加圆角的位置
 @param value 圆角的大小
 */
-(void)jkCutRoundRectCorner:(UIRectCorner)corners withCornerRadius:(CGFloat)value{
    
    UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(value, value)];
    CAShapeLayer* shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    self.layer.mask = shape;
}

@end
