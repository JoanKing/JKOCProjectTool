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

-(UIImage *)jk_setImageWithStretchableImageLeftCapWidth:(NSInteger)leftCapWidth withTopCapHeight:(NSInteger)topCapHeight{
    
  return [self stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:topCapHeight];
}

+(UIImage *)jk_waterMarkImageWithBackImage:(UIImage *)bgImage andMarkImageName:(NSString *)markName{
    
    UIGraphicsBeginImageContextWithOptions(bgImage.size, NO, 0.0);
    [bgImage drawInRect:CGRectMake(0, 0, bgImage.size.width, bgImage.size.height)];
    
    UIImage *waterImage = [UIImage imageNamed:markName];
    CGFloat scale = 0.3;
    CGFloat margin = 5;
    CGFloat waterW = waterImage.size.width * scale;
    CGFloat waterH = waterImage.size.height * scale;
    CGFloat waterX = bgImage.size.width - waterW - margin;
    CGFloat waterY = bgImage.size.height - waterH - margin;
    
    [waterImage drawInRect:CGRectMake(waterX, waterY, waterW, waterH)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

// 给图片添加图片水印
+ (UIImage *)jx_waterMarkImageWithBackgroundImage:(UIImage *)bg_image waterImage:(UIImage *)waterImage waterImageRect:(CGRect)rect{
    
    //1.获取图片
    
    //2.开启上下文
    UIGraphicsBeginImageContextWithOptions(bg_image.size, NO, 0);
    //3.绘制背景图片
    [bg_image drawInRect:CGRectMake(0, 0, bg_image.size.width, bg_image.size.height)];
    //绘制水印图片到当前上下文
    [waterImage drawInRect:rect];
    //4.从上下文中获取新图片
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    //5.关闭图形上下文
    UIGraphicsEndImageContext();
    //返回图片
    return newImage;
}

// 给图片添加文字水印
+(UIImage *)jx_waterImageWithImage:(UIImage *)image text:(NSString *)text textPoint:(CGPoint)point attributedString:(NSDictionary *)attributed{
    //1.开启上下文
    //size新图片的大小
    //opaque YES不透明 NO透明
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    //2.绘制图片
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    //添加水印文字
    [text drawAtPoint:point withAttributes:attributed];
    //3.从上下文中获取新图片
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    //4.关闭图形上下文
    UIGraphicsEndImageContext();
    //返回图片
    return newImage;
}

// 合并两个图片
+ (UIImage*)jk_mergeImage:(UIImage*)firstImage withImage:(UIImage*)secondImage {
    CGImageRef firstImageRef = firstImage.CGImage;
    CGFloat firstWidth = CGImageGetWidth(firstImageRef);
    CGFloat firstHeight = CGImageGetHeight(firstImageRef);
    CGImageRef secondImageRef = secondImage.CGImage;
    CGFloat secondWidth = CGImageGetWidth(secondImageRef);
    CGFloat secondHeight = CGImageGetHeight(secondImageRef);
    CGSize mergedSize = CGSizeMake(MAX(firstWidth, secondWidth), MAX(firstHeight, secondHeight));
    UIGraphicsBeginImageContext(mergedSize);
    [firstImage drawInRect:CGRectMake(0, 0, firstWidth, firstHeight)];
    [secondImage drawInRect:CGRectMake(0, 0, secondWidth, secondHeight)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

/*******************/

@end
