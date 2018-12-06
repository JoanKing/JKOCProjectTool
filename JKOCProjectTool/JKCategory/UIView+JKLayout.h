//
//  UIView+JKLayout.h
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/4.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (JKLayout)

@property CGPoint az_startPoint;
@property CGPoint az_endPoint;
@property(nullable, copy) NSArray *az_colors;
@property(nullable, copy) NSArray<NSNumber *> *az_locations;


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


#pragma mark 1、判断一个view是否在window上面
-(BOOL)isShowingOnWindow;

#pragma mark 2、给继承于UIView类增加切圆角
/**
 给继承于UIView类增加切圆角
 
 @param corners 添加圆角的位置
 @param value 圆角的大小
 */
-(void)jkCutRoundRectCorner:(UIRectCorner)corners withCornerRadius:(CGFloat)value;

#pragma mark 3、给继承于view的类添加 四周 阴影
/**
 给继承于view的类添加 四周 阴影

 @param shadowRadius 阴影半径
 @param theColor 阴影的颜色
 @param size 阴影的偏移度：CGSizeMake(X[正的右偏移,负的左偏移], Y[正的下偏移,负的上偏移]);
 @param opacity 阴影的透明度
 */
- (void)jk_addShadowToViewShadowRadius:(CGFloat)shadowRadius withColor:(UIColor *)theColor withShadowOffset:(CGSize)size withShadowOpacity:(float)opacity;

#pragma mark 4、给继承于view的类添加 单边 阴影
/**
 给继承于view的类添加 单边 阴影

 @param shadowRadius 阴影半径
 @param theColor 阴影的颜色
 @param size 阴影的偏移度：CGSizeMake(X[正的右偏移,负的左偏移], Y[正的下偏移,负的上偏移]);
 @param opacity 阴影的透明度
 */
- (void)jk_addShadowSingleToViewShadowRadius:(CGFloat)shadowRadius withColor:(UIColor *)theColor withShadowOffset:(CGSize)size withShadowOpacity:(float)opacity;

#pragma mark 5、绘制(类方法)渐变色返回一个自身对象
/**
 绘制渐变色返回一个自身对象

 @param colors 颜色数组，最前面的是第一个颜色，后面的依次排列
 @param locations 起始位置
 @param startPoint 开始的点
 @param endPoint 结束的点
 @return 返回的渐变色之后的view
 */
+ (UIView *_Nullable)jk_gradientViewWithColors:(NSArray<UIColor *> *_Nullable)colors locations:(NSArray<NSNumber *> *_Nullable)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;

#pragma mark 6、绘制(对象方法)渐变色
/**
 绘制渐变色

 @param colors 颜色数组，最前面的是第一个颜色，后面的依次排列
 @param locations 起始位置
 @param startPoint 开始的点
 @param endPoint 结束的点
 */
- (void)jk_setGradientBackgroundWithColors:(NSArray<UIColor *> *_Nullable)colors locations:(NSArray<NSNumber *> *_Nullable)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;

@end

NS_ASSUME_NONNULL_END
