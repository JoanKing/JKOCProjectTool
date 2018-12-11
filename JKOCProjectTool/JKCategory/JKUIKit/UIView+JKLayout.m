//
//  UIView+JKLayout.m
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/4.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import "UIView+JKLayout.h"
#import <objc/runtime.h>

static char JKActionHandlerTapBlockKey;
static char JKActionHandlerTapGestureKey;
static char JKActionHandlerLongPressGestureKey;
static char JKActionHandlerLongPressBlockKey;

@implementation UIView (JKLayout)

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

- (void)setBorderWidth:(NSInteger)borderWidth
{
    self.layer.borderWidth = borderWidth;
}

- (NSInteger)borderWidth
{
    return self.layer.borderWidth;
}

- (void)setBorderColor:(UIColor *)borderColor
{
    self.layer.borderColor = borderColor.CGColor;
}

- (UIColor *)borderColor
{
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setBorderHexRgb:(NSString *)borderHexRgb
{
    NSScanner *scanner = [NSScanner scannerWithString:borderHexRgb];
    unsigned hexNum;
    //这里是将16进制转化为10进制
    if (![scanner scanHexInt:&hexNum])
        return;
    self.layer.borderColor = [self colorWithRGBHex:hexNum].CGColor;
}

- (UIColor *)colorWithRGBHex:(UInt32)hex
{
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:1.0f];
}


-(NSString *)borderHexRgb
{
    return @"0xffffff";
}

- (NSArray *)jk_allSubviews
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    
    [array addObjectsFromArray:self.subviews];
    
    for (UIView *view in self.subviews)
    {
        [array addObjectsFromArray:[view jk_allSubviews]];
    }
    
    return array;
}

- (void)jk_removeAllSubviews
{
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
}

- (UIViewController *)jk_findViewController;
{
    UIResponder *responder = self.nextResponder;
    do
    {
        if ([responder isKindOfClass:[UIViewController class]])
        {
            return (UIViewController *)responder;
        }
        responder = responder.nextResponder;
    }
    while (responder);
    
    return nil;
}

- (UIView *)jk_findFirstResponder
{
    if (([self isKindOfClass:[UITextField class]] || [self isKindOfClass:[UITextView class]])
        && (self.isFirstResponder))
    {
        return self;
    }
    
    for (UIView *v in self.subviews)
    {
        UIView *fv = [v jk_findFirstResponder];
        if (fv)
        {
            return fv;
        }
    }
    
    return nil;
}

- (void)jk_addTapActionWithBlock:(TapActionBlock)block
{
    UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, &JKActionHandlerTapGestureKey);
    if (!gesture)
    {
        gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleActionForTapGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &JKActionHandlerTapGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &JKActionHandlerTapBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)handleActionForTapGesture:(UITapGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateRecognized)
    {
        TapActionBlock block = objc_getAssociatedObject(self, &JKActionHandlerTapBlockKey);
        if (block)
        {
            block(gesture);
        }
    }
}


- (void)jk_addLongPressActionWithBlock:(LongPressActionBlock)block
{
    UILongPressGestureRecognizer *gesture = objc_getAssociatedObject(self, &JKActionHandlerLongPressGestureKey);
    if (!gesture)
    {
        gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleActionForLongPressGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &JKActionHandlerLongPressGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &JKActionHandlerLongPressBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)handleActionForLongPressGesture:(UILongPressGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateRecognized)
    {
        LongPressActionBlock block = objc_getAssociatedObject(self, &JKActionHandlerLongPressBlockKey);
        if (block)
        {
            block(gesture);
        }
    }
}

/**-----------**/

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

/**-----------**/

-(void)jkCutRoundRectCorner:(UIRectCorner)corners withCornerRadius:(CGFloat)value{
    
    UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(value, value)];
    CAShapeLayer* shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    self.layer.mask = shape;
}

/**-----------**/

- (void)jk_addShadowToViewShadowRadius:(CGFloat)shadowRadius withColor:(UIColor *)theColor withShadowOffset:(CGSize)size withShadowOpacity:(float)opacity{
    
    // 阴影颜色
    self.layer.shadowColor = theColor.CGColor;
    // 阴影的偏移 CGSizeMake(X[正的右偏移,负的左偏移], Y[正的下偏移,负的上偏移]);
    self.layer.shadowOffset = size;
    // 阴影透明度，默认0,不透明度(不透明度只要大于1就说明是有阴影的)
    self.layer.shadowOpacity = opacity;
    // 阴影半径，默认3
    self.layer.shadowRadius = shadowRadius;
}

/**-----------**/

- (void)jk_addShadowSingleToViewShadowRadius:(CGFloat)shadowRadius withColor:(UIColor *)theColor withShadowOffset:(CGSize)size withShadowOpacity:(float)opacity{

    self.layer.shadowColor = theColor.CGColor;
    self.layer.shadowOffset = size;
    self.layer.shadowOpacity = opacity;
    self.layer.shadowRadius = shadowRadius;
    // 单边阴影 顶边
    float shadowPathWidth = self.layer.shadowRadius;
    CGRect shadowRect = CGRectMake(0, 0-shadowPathWidth/2.0, self.bounds.size.width, shadowPathWidth);
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:shadowRect];
    self.layer.shadowPath = path.CGPath;
}

/**-----------**/

+ (Class)layerClass {
    return [CAGradientLayer class];
}

+ (UIView *)jk_gradientViewWithColors:(NSArray<UIColor *> *)colors locations:(NSArray<NSNumber *> *)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint {
    UIView *view = [[self alloc] init];
    [view jk_setGradientBackgroundWithColors:colors locations:locations startPoint:startPoint endPoint:endPoint];
    return view;
}

- (void)jk_setGradientBackgroundWithColors:(NSArray<UIColor *> *)colors locations:(NSArray<NSNumber *> *)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint {
    NSMutableArray *colorsM = [NSMutableArray array];
    
    for (UIColor *color in colors) {
        [colorsM addObject:(__bridge id)color.CGColor];
    }
    self.jk_colors = [colorsM copy];
    self.jk_locations = locations;
    self.jk_startPoint = startPoint;
    self.jk_endPoint = endPoint;
}

- (NSArray *)jk_colors {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setJk_colors:(NSArray *)colors {
    objc_setAssociatedObject(self, @selector(jk_colors), colors, OBJC_ASSOCIATION_COPY_NONATOMIC);
    if ([self.layer isKindOfClass:[CAGradientLayer class]]) {
        [((CAGradientLayer *)self.layer) setColors:self.jk_colors];
    }
}

- (NSArray<NSNumber *> *)jk_locations {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setJk_locations:(NSArray<NSNumber *> *)locations {
    objc_setAssociatedObject(self, @selector(jk_locations), locations, OBJC_ASSOCIATION_COPY_NONATOMIC);
    if ([self.layer isKindOfClass:[CAGradientLayer class]]) {
        [((CAGradientLayer *)self.layer) setLocations:self.jk_locations];
    }
}

- (CGPoint)jk_startPoint {
    return [objc_getAssociatedObject(self, _cmd) CGPointValue];
}

-(void)setJk_startPoint:(CGPoint)startPoint{
    
    objc_setAssociatedObject(self, @selector(jk_startPoint), [NSValue valueWithCGPoint:startPoint], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if ([self.layer isKindOfClass:[CAGradientLayer class]]) {
        [((CAGradientLayer *)self.layer) setStartPoint:self.jk_startPoint];
    }
}


- (CGPoint)jk_endPoint {
    return [objc_getAssociatedObject(self, _cmd) CGPointValue];
}

- (void)setJk_endPoint:(CGPoint)endPoint {
    objc_setAssociatedObject(self, @selector(jk_endPoint), [NSValue valueWithCGPoint:endPoint], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if ([self.layer isKindOfClass:[CAGradientLayer class]]) {
        [((CAGradientLayer *)self.layer) setEndPoint:self.jk_endPoint];
    }
}

/**-----------**/

- (UIImage *)jk_snapshotImage {
    
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, 0);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return result;
}

-(UIImage *)jk_snapshotImageSize:(CGSize)pitureSize
{
    //1.开启一个和传进来的View大小一样的位图上下文
    UIGraphicsBeginImageContextWithOptions(self.bounds.size,NO,0);
    //2.把控制器的View绘制到上下文当中
    //想把UIView上面的东西绘制到上下文当中,必须得使用渲染的方式
    //renderInContext:就是渲染的方式
    CGContextRef ctx= UIGraphicsGetCurrentContext();
    [self.layer renderInContext:ctx ];
    
    //3从上下文当中生成一张图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsBeginImageContext(CGSizeMake(pitureSize.width, pitureSize.height));
    [newImage drawInRect:CGRectMake(0, 0, pitureSize.width, pitureSize.height)];
    
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    //4.关闭上下文
    UIGraphicsEndImageContext();
    
    return reSizeImage;
}

-(void)jk_snapshotImageSizePath:(NSString *)path withPicturetype:(NSString *)type withSize:(CGSize)pitureSize
{
    //1.开启一个和传进来的View大小一样的位图上下文
    UIGraphicsBeginImageContextWithOptions(self.bounds.size,NO,0);
    //2.把控制器的View绘制到上下文当中
    //想把UIView上面的东西绘制到上下文当中,必须得使用渲染的方式
    //renderInContext:就是渲染的方式
    CGContextRef ctx= UIGraphicsGetCurrentContext();
    
    [self.layer renderInContext:ctx ];
    
    //3从上下文当中生成一张图片
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsBeginImageContext(CGSizeMake(pitureSize.width, pitureSize.height));
    
    [newImage drawInRect:CGRectMake(0, 0, pitureSize.width, pitureSize.height)];
    
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    //4.关闭上下文
    UIGraphicsEndImageContext();
    
    //5.把生成的图片写入到桌面(以文件的方式进行传输:二进制流NSData,即把图片转为二进制流)
    NSData *data;
    
    if ([type isEqualToString:@"png"]) {
        
        //生成PNG格式的图片
        data = UIImagePNGRepresentation(reSizeImage);
        
    }else if ([type isEqualToString:@"jpg"]){
        
        //5.1把图片转为二进制流(第一个参数是图片,第2个参数是图片压缩质量:1是最原始的质量)
        data = UIImageJPEGRepresentation(reSizeImage,1);
    }
    
    [data writeToFile:path atomically:YES];
    
}

-(UIImage *)testCgrect:(CGRect)rect{
    
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, 1);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIImage *resultImg = [UIImage imageWithCGImage:CGImageCreateWithImageInRect(img.CGImage, rect)];
    UIGraphicsEndImageContext();
    
    return resultImg;
}

@end
