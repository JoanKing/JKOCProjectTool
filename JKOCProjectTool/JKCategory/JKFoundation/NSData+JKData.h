//
//  NSData+JKData.h
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/11.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (JKData)

#pragma mark 1、按照图片原来的大小直接压缩
/**
 按照图片原来的大小直接压缩

 @param sourceImage 原图片的对象
 @return 返回压缩过的data
 */
+(NSData *)jk_zipNSDataWithImage:(UIImage *)sourceImage;

#pragma mark 2、原图片先进行一定的值缩放，再压缩
/**
 原图片先进行一定的值缩放，再压缩

 @param sourceImage 原图片的对象
 @param zoomValue 缩放值
 @return 返回缩放与压缩过的data
 */
+(NSData *)jk_zipNSDataWithImage:(UIImage *)sourceImage withZoomValue:(CGFloat)zoomValue;

#pragma mark 3、压缩图片到指定文件大小
/**
 压缩图片到指定文件大小

 @param image 目标图片
 @param size 目标大小（最大值）单位是 b
 @return 返回的图片文件
 */
+(NSData *)jk_zipOriginalImageFixedBytes:(UIImage *)image toMaxDataSizeKBytes:(CGFloat)size;

#pragma mark 4、利用二分法压缩图片的质量(比3更好些)
/**
 利用二分法压缩图片的质量

 @param image 目标图片
 @param maxLength 目标最大字节数（最大值）单位是 b
 @return 返回的图片文件
 */
+(UIImage *)jk_zipImageQuality:(UIImage *)image toMaxDataByteLength:(NSInteger)maxLength;

#pragma mark 5、将URL作为key保存到磁盘里缓存起来

/**
 将URL作为key保存到磁盘里缓存起来

 @param identifier url.absoluteString
 */
- (void)jk_saveDataCacheWithIdentifier:(NSString *)identifier;

#pragma mark 6、取出缓存data

/**
 取出缓存data

 @param identifier url.absoluteString
 @return 缓存
 */
+ (NSData *)jk_getDataCacheWithIdentifier:(NSString *)identifier;


@end

NS_ASSUME_NONNULL_END
