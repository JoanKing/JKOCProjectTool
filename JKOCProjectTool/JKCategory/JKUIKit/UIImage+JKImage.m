//
//  UIImage+JKUIImageRedraw.m
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/5.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import "UIImage+JKImage.h"

@implementation UIImage (JKImage)

- (UIImage *)jk_imageScaleToSureSize:(CGSize)newSize{
    
    // 创建context,并将其设置为正在使用的context
    UIGraphicsBeginImageContext(newSize);
    // 绘制出图片(大小已经改变)
    [self drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    // 获取改变大小之后的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // context出栈
    UIGraphicsEndImageContext();
    // 返回获得的图片
    return newImage;
}

-(UIImage *)jk_imageZoomSize:(CGSize)newSize{
    //进行图像尺寸的压缩
    CGSize imageSize = self.size;//取出要压缩的image尺寸
    CGFloat width = imageSize.width;    //图片宽度
    CGFloat height = imageSize.height;  //图片高度
    //1.宽高大于1280(宽高比不按照2来算，按照1来算)
    if (width>newSize.width||height>newSize.height) {
        if (width>height) {
            CGFloat scale = height/width;
            width = newSize.width;
            height = width*scale;
        }else{
            CGFloat scale = width/height;
            height = newSize.height;
            width = height*scale;
        }
        //2.宽大于1280高小于1280
    }else if(width>newSize.width||height<newSize.height){
        CGFloat scale = height/width;
        width = newSize.width;
        height = width*scale;
        //3.宽小于1280高大于1280
    }else if(width<newSize.width||height>newSize.height){
        CGFloat scale = width/height;
        height = newSize.height;
        width = height*scale;
        //4.宽高都小于1280
    }else{
        //5.宽高都超过某一个尺寸，就不再进行比例缩小
    }
    //进行尺寸重绘
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    [self drawInRect:CGRectMake(0,0,width,height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

-(UIImage *)jk_imageScale{
    
    CGFloat scaleToSize = 0;
    
    if (self.size.width > self.size.height) {
        scaleToSize = self.size.height;
    }else{
        scaleToSize = self.size.width;
    }
    
    // 缩放比例
    CGAffineTransform scaleTransform;
    CGPoint origin;
    
    // 图片大小大于图片高度的情况
    if (self.size.width > self.size.height)
    {
        //举例：image原始高度为100，缩放image的高度为200pixels，所以缩放比率为2
        // 计算缩放比例
        CGFloat scaleRatio = scaleToSize / self.size.height;
        
        scaleTransform = CGAffineTransformMakeScale(scaleRatio, scaleRatio);
        
        //设置绘制原始图片的画笔坐标为CGPoint(-100, 0)pixels
        // 计算画笔的X轴
        origin = CGPointMake(-(self.size.width - self.size.height) / 2.0f, 0);
    }else{
        // 图片的高度大于宽度的情况
        
        CGFloat scaleRatio = scaleToSize / self.size.width;
        scaleTransform = CGAffineTransformMakeScale(scaleRatio, scaleRatio);
        
        // 计算画笔的Y轴
        origin = CGPointMake(0, -(self.size.height - self.size.width) / 2.0f);
    }
    
    CGSize size = CGSizeMake(scaleToSize, scaleToSize);
    
    //创建画板为(400x400)pixels
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)])
    {
        UIGraphicsBeginImageContextWithOptions(size, YES, 0);
    }else{
        UIGraphicsBeginImageContext(size);
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //将image原始图片(200x100)pixels缩放为(400x200)pixels
    CGContextConcatCTM(context, scaleTransform);
    
    //origin也会从原始(-100, 0)缩放到(-200, 0)
    [self drawAtPoint:origin];
    
    //获取缩放后剪切的image图片
    UIImage *scaleImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束画板绘制
    UIGraphicsEndImageContext();
    
    return scaleImage;
}

- (UIImage *)jk_imageZoomScaledToSize:(CGSize)newSize
{
    UIImage *image = [self jk_imageZoomSize:newSize];
    
    return [image jk_imageScale];
}

-(UIImage *)jk_scaleImageFromInRect:(CGRect)rect{
    
    //把像 素rect 转化为 点rect（如无转化则按原图像素取部分图片）
    CGFloat scale = [UIScreen mainScreen].scale;
    CGFloat x= rect.origin.x*scale,y=rect.origin.y*scale,w=rect.size.width*scale,h=rect.size.height*scale;
    CGRect dianRect = CGRectMake(x, y, w, h);
    
    //截取部分图片并生成新图片
    CGImageRef sourceImageRef = [(UIImage *)self CGImage];
    CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, dianRect);
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp];
    return newImage;
}


/*******************/

+ (UIImage *)jk_imageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size text:(NSAttributedString *)attributeString {
    UIImage *image = [UIImage jk_imageWithColor:color size:size];
    
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    CGSize textSize = [attributeString size];
    CGFloat textX = (size.width - textSize.width) / 2.f;
    CGFloat textY = (size.height - textSize.height) / 2.f;
    CGRect textRect = CGRectMake(textX, textY, textSize.width,textSize.height);
    
    UIGraphicsBeginImageContext(size);
    [image drawInRect:rect];
    [attributeString drawInRect:textRect];
    UIImage *newImage =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (UIImage *)ellipseImage:(UIImage *)image withInset:(CGFloat)inset {
    return [self ellipseImage:image withInset:inset withBorderWidth:0 withBorderColor:[UIColor clearColor]];
}

+ (UIImage *)ellipseImage: (UIImage *) image withInset:(CGFloat)inset withBorderWidth:(CGFloat)width withBorderColor:(UIColor*)color {
    UIGraphicsBeginImageContext(image.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect rect = CGRectMake(inset, inset, image.size.width - inset * 2.f , image.size.height - inset * 2.f);
    
    CGContextAddEllipseInRect(context, rect);
    CGContextClip(context);
    [image drawInRect:rect];
    
    if (width > 0) {
        CGContextSetStrokeColorWithColor(context, color.CGColor);
        CGContextSetLineCap(context,kCGLineCapButt);
        CGContextSetLineWidth(context, width);
        CGRect rect2 = CGRectMake(inset + width/2, inset +  width/2, image.size.width - width- inset * 2.0f, image.size.height - width- inset * 2.0f);
        CGContextAddEllipseInRect(context, rect2);
        
        CGContextStrokePath(context);
    }
    
    UIImage *newimg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newimg;
}





@end
