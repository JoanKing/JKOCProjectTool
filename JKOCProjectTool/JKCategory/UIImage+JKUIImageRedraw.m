//
//  UIImage+JKUIImageRedraw.m
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/5.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import "UIImage+JKUIImageRedraw.h"

@implementation UIImage (JKUIImageRedraw)

- (UIImage *)jk_ImageScaleToSize:(CGSize)newSize{
    
    UIGraphicsBeginImageContext(newSize);
    [self drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

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
