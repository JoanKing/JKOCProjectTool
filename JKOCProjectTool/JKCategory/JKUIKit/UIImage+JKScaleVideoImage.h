//
//  UIImage+JKScaleVideoImage.h
//  JKOCProjectToolDemo
//
//  Created by 王冲 on 2018/12/17.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (JKScaleVideoImage)

#pragma mark 1、截取指定时间的视频缩略图
/**
 截取指定时间的视频缩略图
 
 @param videoUrl 视频的链接
 @param videoTime 时间点，单位：s
 @param imageMaxSize 最大尺寸
 @return 返回一个图片
 */
+(UIImage *)jk_videoThumbnailImageWithVideoUrl:(NSString *)videoUrl withVideoTime:(CGFloat)videoTime withVideoImageMaxSize:(CGSize)imageMaxSize;


@end

NS_ASSUME_NONNULL_END
