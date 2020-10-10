//
//  UIView+JKLayout.h
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/4.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^TapActionBlock)(UITapGestureRecognizer *gestureRecoginzer);
typedef void (^LongPressActionBlock)(UILongPressGestureRecognizer *gestureRecoginzer);


@interface UIView (JKLayout)

@property CGPoint jk_startPoint;
@property CGPoint jk_endPoint;
@property(nullable, copy) NSArray *jk_colors;
@property(nullable, copy) NSArray<NSNumber *> *jk_locations;


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

/** 设置 view的 边框颜色(选择器和Hex颜色)以及 边框的宽度 */
@property (assign,nonatomic) NSInteger borderWidth;
@property (strong,nonatomic) NSString  *borderHexRgb;
@property (strong,nonatomic) UIColor   *borderColor;

/** 所有子视图 */
- (NSArray *)jk_allSubviews;
/** 移除所有子视图 */
- (void)jk_removeAllSubviews;
/** 找到当前view所在的viewcontroler */
- (UIViewController *)jk_findCurrentViewController;
/** 找到view上的第一响应者 */
- (UIView *)jk_findFirstResponder;
/** 添加tap手势 */
- (void)jk_addTapActionWithBlock:(TapActionBlock)block;
/** 添加长按手势 */
- (void)jk_addLongPressActionWithBlock:(LongPressActionBlock)block;

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
 @param locations 起始位置 一般是nil
 @param startPoint 开始的点 (0,0) x与y -- 最小值：0 最大值：1
 @param endPoint 结束的点 (0,0) x与y -- 最小值：0 最大值：1
 @return 返回的渐变色之后的view
 */
+ (UIView *_Nullable)jk_gradientViewWithColors:(NSArray<UIColor *> *_Nullable)colors locations:(NSArray<NSNumber *> *_Nullable)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;

#pragma mark 6、绘制(对象方法)渐变色
/**
 绘制渐变色

 @param colors 颜色数组，最前面的是第一个颜色，后面的依次排列
 @param locations 起始位置 一般是nil
 @param startPoint 开始的点 (0,0) x与y -- 最小值：0 最大值：1
 @param endPoint 结束的点 (0,0) x与y -- 最小值：0 最大值：1
 */
- (void)jk_setGradientBackgroundWithColors:(NSArray<UIColor *> *_Nullable)colors locations:(NSArray<NSNumber *> *_Nullable)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;

#pragma mark 7、截取成图片 返回一个和自身大小的图片
- (UIImage *)jk_snapshotImage;

#pragma mark 8、截取成图片: 指定 宽高

/**
 截取成图片: 指定 宽高

 @param pitureSize 宽高
 @return 返回一个图片对象
 */
-(UIImage *)jk_snapshotImageSize:(CGSize)pitureSize;

#pragma mark 9、截取成图片:路径  指定 宽高；把一个UIView生成PNG或者JPG格式的图片,保存在指定路径

/**
 把一个UIView生成PNG或者JPG格式的图片,保存在指定路径

 @param path 图片要保存到的路径
 @param type 图片的格式png或者jpg
 @param pitureSize 保存图片的尺寸
 */
- (void)jk_snapshotImageSizePath:(NSString *)path withPicturetype:(NSString *)type withSize:(CGSize)pitureSize;

#pragma mark 10、通过 CAShapeLayer 方式绘制虚线
/**
 通过 CAShapeLayer 方式绘制虚线
 
 @param lineWidth 虚线的宽度
 @param lineSpacing 虚线的间距
 @param lineColor 虚线的颜色
 @param isHorizonal 虚线的方向  YES 为水平方向， NO 为垂直方向
 */
- (void)jk_drawLineOfDashByCAShapeLayerLineWidth:(int)lineWidth withLineSpacing:(int)lineSpacing withLineColor:(UIColor *)lineColor withLineDirection:(BOOL)isHorizonal;

/// 添加阴影和部分圆角
/// @param superView 父视图
/// @param corners 圆角
/// @param cornerRadius 圆角大小
/// @param shadowRadius 阴影的圆角大小
/// @param shadowColor 阴影的颜色
/// @param offset 阴影的偏移度：CGSizeMake(X[正的右偏移,负的左偏移], Y[正的下偏移,负的上偏移]);
/// @param opacity 阴影的透明度
- (void)addShadowAndCornerSuperView:(UIView *)superView roundRectCorner:(UIRectCorner)corners withCornerRadius:(CGFloat)cornerRadius shadowRadius:(CGFloat)shadowRadius shadowColor:(UIColor *)shadowColor withShadowOffset:(CGSize)offset withShadowOpacity:(float)opacity;


@end

NS_ASSUME_NONNULL_END
